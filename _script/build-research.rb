#!/usr/bin/env ruby
# frozen_string_literal: true

require "kramdown"
require "digest"
require "cgi"

SCRIPT_DIR = __dir__
REPO_ROOT = File.expand_path("..", SCRIPT_DIR)
RESEARCH_DIR = File.join(REPO_ROOT, "research")
TEMPLATE_PATH = File.join(SCRIPT_DIR, "research-template.html")

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

def build_html(md_src, slug, template)
  parsed = parse_research_markdown(md_src)

  replacements = {
    "{{TITLE}}" => parsed[:heading],
    "{{HEADING}}" => parsed[:heading],
    "{{DATELINE}}" => parsed[:dateline],
    "{{TOC}}" => parsed[:toc],
    "{{CONTENT}}" => parsed[:content],
    "{{STORAGE_KEY}}" => "research-#{slug}-checklist",
    "{{THEME_KEY}}" => "research-#{slug}-theme"
  }
  template.gsub(/\{\{[A-Z_]+\}\}/) { |token| replacements.fetch(token, token) }
end

def discover_slugs
  Dir.glob(File.join(RESEARCH_DIR, "*", "_research.md")).sort.map do |path|
    File.basename(File.dirname(path))
  end
end

def main
  argv = ARGV.dup
  check_mode = !!argv.delete("--check")
  slugs = argv.empty? ? discover_slugs : argv

  if slugs.empty?
    warn "No research/*/_research.md files found."
    exit 0
  end

  template = File.read(TEMPLATE_PATH)
  out_of_date = []

  slugs.each do |slug|
    md_path = File.join(RESEARCH_DIR, slug, "_research.md")
    out_path = File.join(RESEARCH_DIR, slug, "index.html")

    unless File.exist?(md_path)
      abort "error: #{md_path} does not exist"
    end

    md_src = File.read(md_path)

    begin
      html = build_html(md_src, slug, template)
    rescue => e
      abort "error: failed to build research/#{slug}: #{e.message}"
    end

    if check_mode
      current = File.exist?(out_path) ? File.read(out_path) : nil
      out_of_date << slug if current != html
    else
      File.write(out_path, html)
      puts "wrote research/#{slug}/index.html"
    end
  end

  if check_mode
    if out_of_date.empty?
      puts "up to date: #{slugs.join(', ')}"
      exit 0
    else
      warn "out of date: #{out_of_date.join(', ')}"
      exit 1
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
