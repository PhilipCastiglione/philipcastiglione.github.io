#!/usr/bin/env ruby
# frozen_string_literal: true

require "kramdown"
require "digest"
require "cgi"
require "openssl"
require "base64"
require "json"

SCRIPT_DIR = __dir__
REPO_ROOT = File.expand_path("..", SCRIPT_DIR)
RESEARCH_DIR = File.join(REPO_ROOT, "research")
TEMPLATE_PATH = File.join(SCRIPT_DIR, "research-template.html")
RESEARCH_KEY_PATH = File.join(REPO_ROOT, ".research-key")

HEADING_RE = /\A(\d+(?:\.\d+)*)\.?\s/
CALLOUT_START_RE = /\A>\s*\[!(KEY|WARNING|ACTION|LEGAL)\]\s*(.*)\z/
BLOCKQUOTE_LINE_RE = /\A>\s?(.*)\z/
CHECKLIST_RE = /\A-\s*\[([ xX])\]\s+(.*)\z/
H2_RE = /\A##\s+(.*)\z/
H3_RE = /\A###\s+(.*)\z/
H1_RE = /\A#\s+(.+)\z/

CALLOUT_LABELS = {
  "KEY" => "✓ Key finding",
  "WARNING" => "⚠ Warning",
  "ACTION" => "☐ Action"
}.freeze

CALLOUT_CLASSES = {
  "KEY" => "callout-key",
  "WARNING" => "callout-warn",
  "ACTION" => "callout-action"
}.freeze

PBKDF2_ITERATIONS = 600_000
AES_KEY_LEN = 32
GCM_TAG_LEN = 16

def html_escape(text)
  CGI.escapeHTML(text)
end

def add_external_link_attrs(html)
  html.gsub(/<a\b([^>]*)>/) do
    attrs = Regexp.last_match(1)
    if attrs =~ /href="(https?:\/\/[^"]*)"/
      "<a#{attrs} target=\"_blank\" rel=\"noopener noreferrer\">"
    else
      "<a#{attrs}>"
    end
  end
end

def render_markdown(src)
  html = Kramdown::Document.new(src, input: "GFM", auto_ids: false).to_html
  add_external_link_attrs(html)
end

def wrap_tables(html)
  html.gsub(/<table>.*?<\/table>/m) { |t| "<div class=\"table-wrap\">\n#{t}\n</div>" }
end

def render_block(src)
  wrap_tables(render_markdown(src))
end

def render_inline(src)
  html = render_markdown(src).strip
  if html.start_with?("<p>") && html.end_with?("</p>")
    html[3..-5]
  else
    html
  end
end

def slugify(text)
  slug = text.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-+|-+\z/, "")
  slug.empty? ? "sec" : slug
end

def compute_id(text, used_ids)
  m = HEADING_RE.match(text)
  base = m ? "sec-#{m[1].tr('.', '-')}" : slugify(text)
  id = base
  n = 2
  while used_ids.key?(id)
    id = "#{base}-#{n}"
    n += 1
  end
  used_ids[id] = true
  id
end

def parse_research_markdown(src)
  lines = src.split("\n", -1)
  lines.pop if lines.last == ""

  h1_index = lines.index { |l| H1_RE.match?(l) }
  raise "no H1 heading found" unless h1_index

  h1_text = H1_RE.match(lines[h1_index])[1].strip

  n = lines.length
  first_h2_index = ((h1_index + 1)...n).find { |i| H2_RE.match?(lines[i]) } || n

  j = h1_index + 1
  j += 1 while j < first_h2_index && lines[j].strip.empty?
  dateline_lines = []
  while j < first_h2_index && !lines[j].strip.empty?
    dateline_lines << lines[j]
    j += 1
  end
  dateline_html = dateline_lines.empty? ? "" : "<p class=\"dateline\">#{render_inline(dateline_lines.join("\n"))}</p>"

  prologue_lines = lines[j...first_h2_index]

  content_parts = []
  unless prologue_lines.all? { |l| l.strip.empty? }
    content_parts << render_block(prologue_lines.join("\n"))
  end

  used_ids = {}
  toc_items = []
  h2_open = false
  h3_open = false
  checklist_count = 0

  idx = first_h2_index
  while idx < n
    line = lines[idx]

    if (m = H2_RE.match(line))
      content_parts << "</section>\n" if h3_open
      content_parts << "</section>\n" if h2_open
      h3_open = false
      text = m[1].strip
      id = compute_id(text, used_ids)
      esc = html_escape(text)
      content_parts << "<section id=\"#{id}\">\n<h2>#{esc}</h2>\n"
      toc_items << "<li class=\"toc-h2\"><a href=\"##{id}\">#{esc}</a></li>"
      h2_open = true
      idx += 1

    elsif (m = H3_RE.match(line))
      content_parts << "</section>\n" if h3_open
      text = m[1].strip
      id = compute_id(text, used_ids)
      esc = html_escape(text)
      content_parts << "<section id=\"#{id}\">\n<h3>#{esc}</h3>\n"
      h3_open = true
      idx += 1

    elsif (m = CALLOUT_START_RE.match(line))
      type = m[1]
      rest = m[2].strip
      idx += 1
      body_lines = []
      while idx < n && lines[idx].start_with?(">")
        body_lines << BLOCKQUOTE_LINE_RE.match(lines[idx])[1]
        idx += 1
      end
      body_html = render_block(body_lines.join("\n"))

      if type == "LEGAL"
        cite = html_escape(rest)
        content_parts << "<blockquote class=\"legal\">\n<p class=\"legal-cite\">#{cite}</p>\n#{body_html}</blockquote>\n"
      else
        label = CALLOUT_LABELS[type].dup
        label << " — #{html_escape(rest)}" unless rest.empty?
        content_parts << "<div class=\"callout #{CALLOUT_CLASSES[type]}\">\n<p class=\"callout-label\">#{label}</p>\n#{body_html}</div>\n"
      end

    elsif CHECKLIST_RE.match?(line)
      items = []
      while idx < n && (m = CHECKLIST_RE.match(lines[idx]))
        checked = m[1] != " "
        raw_text = m[2].rstrip
        items << [checked, raw_text]
        idx += 1
      end
      checklist_count += 1
      list_id = checklist_count == 1 ? "supplierChecklist" : "supplierChecklist-#{checklist_count}"
      button_id = checklist_count == 1 ? "resetChecklist" : "resetChecklist-#{checklist_count}"
      lis = items.map do |checked, raw_text|
        key = Digest::SHA256.hexdigest(raw_text)[0, 8]
        checked_attr = checked ? " checked" : ""
        "<li><label><input type=\"checkbox\" data-key=\"#{key}\"#{checked_attr}><span>#{render_inline(raw_text)}</span></label></li>"
      end.join("\n")
      content_parts << "<ul class=\"checklist\" id=\"#{list_id}\">\n#{lis}\n</ul>\n<button type=\"button\" id=\"#{button_id}\">Reset checklist</button>\n"

    else
      run_start = idx
      idx += 1 while idx < n &&
                      !H2_RE.match?(lines[idx]) &&
                      !H3_RE.match?(lines[idx]) &&
                      !CALLOUT_START_RE.match?(lines[idx]) &&
                      !CHECKLIST_RE.match?(lines[idx])
      run_src = lines[run_start...idx].join("\n")
      content_parts << render_block(run_src) unless run_src.strip.empty?
    end
  end

  content_parts << "</section>\n" if h3_open
  content_parts << "</section>\n" if h2_open

  {
    heading: html_escape(h1_text),
    dateline: dateline_html,
    toc: toc_items.join("\n"),
    content: content_parts.join
  }
end

# Salt/iv are derived from slug+plaintext (not random) so re-encrypting
# unchanged content is byte-identical and `--check` stays meaningful.
def derive_salt(slug, plaintext)
  Digest::SHA256.digest("research-salt:#{slug}\0#{plaintext}")[0, 16]
end

def derive_iv(slug, plaintext)
  Digest::SHA256.digest("research-iv:#{slug}\0#{plaintext}")[0, 12]
end

def derive_key(passphrase, salt)
  OpenSSL::PKCS5.pbkdf2_hmac(passphrase, salt, PBKDF2_ITERATIONS, AES_KEY_LEN, OpenSSL::Digest.new("SHA256"))
end

def encrypt_payload(plaintext, slug, passphrase)
  salt = derive_salt(slug, plaintext)
  iv = derive_iv(slug, plaintext)
  key = derive_key(passphrase, salt)

  cipher = OpenSSL::Cipher.new("aes-256-gcm")
  cipher.encrypt
  cipher.key = key
  cipher.iv = iv
  ciphertext = cipher.update(plaintext) + cipher.final
  { salt: salt, iv: iv, ciphertext: ciphertext + cipher.auth_tag }
end

def decrypt_payload(salt, iv, blob, passphrase)
  key = derive_key(passphrase, salt)
  tag = blob[-GCM_TAG_LEN, GCM_TAG_LEN]
  ciphertext = blob[0...-GCM_TAG_LEN]

  cipher = OpenSSL::Cipher.new("aes-256-gcm")
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv
  cipher.auth_tag = tag
  cipher.update(ciphertext) + cipher.final
end

def serialize_enc(enc)
  JSON.generate(
    "salt" => Base64.strict_encode64(enc[:salt]),
    "iv" => Base64.strict_encode64(enc[:iv]),
    "ciphertext" => Base64.strict_encode64(enc[:ciphertext])
  )
end

def parse_enc(src)
  data = JSON.parse(src)
  {
    salt: Base64.strict_decode64(data.fetch("salt")),
    iv: Base64.strict_decode64(data.fetch("iv")),
    ciphertext: Base64.strict_decode64(data.fetch("ciphertext"))
  }
end

def load_passphrase
  env_key = ENV["RESEARCH_KEY"]
  return env_key.strip if env_key && !env_key.strip.empty?

  if File.exist?(RESEARCH_KEY_PATH)
    file_key = File.read(RESEARCH_KEY_PATH).strip
    return file_key unless file_key.empty?
  end

  abort "error: no research passphrase found. Set RESEARCH_KEY or create #{RESEARCH_KEY_PATH}."
end

def research_passphrase
  @research_passphrase ||= load_passphrase
end

def build_html(md_src, slug, template, passphrase)
  parsed = parse_research_markdown(md_src)
  payload_json = JSON.generate(
    "heading" => parsed[:heading],
    "dateline" => parsed[:dateline],
    "toc" => parsed[:toc],
    "content" => parsed[:content]
  )
  enc = encrypt_payload(payload_json, slug, passphrase)

  # Headings can name places the slug doesn't, so they are encrypted too.
  public_title = "#{slug} — protected research"

  replacements = {
    "{{TITLE}}" => html_escape(public_title),
    "{{HEADING}}" => "",
    "{{STORAGE_KEY}}" => "research-#{slug}-checklist",
    "{{THEME_KEY}}" => "research-#{slug}-theme",
    "{{PASSPHRASE_KEY}}" => "research-#{slug}-key",
    "{{SALT_B64}}" => Base64.strict_encode64(enc[:salt]),
    "{{IV_B64}}" => Base64.strict_encode64(enc[:iv]),
    "{{CIPHERTEXT_B64}}" => Base64.strict_encode64(enc[:ciphertext]),
    "{{PBKDF2_ITERATIONS}}" => PBKDF2_ITERATIONS.to_s
  }
  template.gsub(/\{\{[A-Z0-9_]+\}\}/) { |token| replacements.fetch(token, token) }
end

def discover_slugs
  Dir.glob(File.join(RESEARCH_DIR, "*")).select { |p| File.directory?(p) }.sort.filter_map do |dir|
    slug = File.basename(dir)
    md_path = File.join(dir, "_research.md")
    enc_path = File.join(dir, "_research.md.enc")

    if File.exist?(md_path)
      slug
    elsif File.exist?(enc_path)
      warn "note: research/#{slug} has only _research.md.enc — run `--decrypt #{slug}` first, skipping"
      nil
    end
  end
end

def run_decrypt(slug, force)
  dir = File.join(RESEARCH_DIR, slug)
  enc_path = File.join(dir, "_research.md.enc")
  md_path = File.join(dir, "_research.md")

  abort "error: #{enc_path} does not exist" unless File.exist?(enc_path)
  if File.exist?(md_path) && !force
    abort "error: #{md_path} already exists; pass --force to overwrite"
  end

  enc = parse_enc(File.read(enc_path))
  passphrase = research_passphrase

  begin
    plaintext = decrypt_payload(enc[:salt], enc[:iv], enc[:ciphertext], passphrase)
  rescue OpenSSL::Cipher::CipherError
    abort "error: failed to decrypt research/#{slug}/_research.md.enc — wrong passphrase?"
  end

  File.write(md_path, plaintext)
  puts "wrote research/#{slug}/_research.md"
end

def main
  argv = ARGV.dup
  check_mode = !!argv.delete("--check")
  force = !!argv.delete("--force")

  if (idx = argv.index("--decrypt"))
    argv.delete_at(idx)
    slug = argv.delete_at(idx)
    abort "error: --decrypt requires a slug argument" unless slug
    run_decrypt(slug, force)
    return
  end

  slugs = argv.empty? ? discover_slugs : argv

  if slugs.empty?
    warn "No research/*/_research.md or _research.md.enc files found."
    exit 0
  end

  template = File.read(TEMPLATE_PATH)
  out_of_date = []
  processed = []

  slugs.each do |slug|
    dir = File.join(RESEARCH_DIR, slug)
    md_path = File.join(dir, "_research.md")
    enc_path = File.join(dir, "_research.md.enc")
    out_path = File.join(dir, "index.html")

    unless File.exist?(md_path)
      if File.exist?(enc_path)
        warn "note: research/#{slug} has only _research.md.enc — run `--decrypt #{slug}` first, skipping"
        next
      else
        abort "error: #{md_path} does not exist"
      end
    end

    md_src = File.read(md_path)
    passphrase = research_passphrase

    begin
      html = build_html(md_src, slug, template, passphrase)
      enc_json = serialize_enc(encrypt_payload(md_src, slug, passphrase))
    rescue => e
      abort "error: failed to build research/#{slug}: #{e.message}"
    end

    processed << slug

    if check_mode
      current_html = File.exist?(out_path) ? File.read(out_path) : nil
      current_enc = File.exist?(enc_path) ? File.read(enc_path) : nil
      out_of_date << slug if current_html != html || current_enc != enc_json
    else
      File.write(out_path, html)
      File.write(enc_path, enc_json)
      puts "wrote research/#{slug}/index.html"
      puts "wrote research/#{slug}/_research.md.enc"
    end
  end

  if check_mode
    if out_of_date.empty?
      puts "up to date: #{processed.join(', ')}"
      exit 0
    else
      warn "out of date: #{out_of_date.join(', ')}"
      exit 1
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
