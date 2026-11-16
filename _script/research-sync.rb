# frozen_string_literal: true

require "fileutils"
require "io/console"
require "open3"
require "shellwords"

def research_git(*args)
  output, _, status = Open3.capture3("git", *args, chdir: REPO_ROOT)
  output.strip if status.success?
end

def install_research_hooks
  if research_git("config", "--get", "core.hooksPath")
    warn "Custom Git hooks path in use. Add `ruby _script/build-research.rb --sync` to your pull hooks or run it after pulling."
    return
  end

  hook = <<~SH
    #!/bin/sh
    [ "$1" = amend ] && exit 0
    [ -f _script/research-sync.rb ] || exit 0
    [ "$1" = rebase ] && cat > /dev/null
    exec #{Shellwords.escape(RbConfig.ruby)} _script/build-research.rb --sync
  SH

  %w[post-merge post-rewrite].each do |name|
    path = research_git("rev-parse", "--path-format=absolute", "--git-path", "hooks/#{name}")
    abort "error: cannot locate Git hook #{name}" unless path

    FileUtils.mkdir_p(File.dirname(path))
    begin
      File.open(path, File::WRONLY | File::CREAT | File::EXCL, 0o700) { |file| file.write(hook) }
    rescue Errno::EEXIST
      next if File.file?(path) && File.read(path) == hook && File.executable?(path)

      warn "Existing #{name} hook kept. Add `ruby _script/build-research.rb --sync` to it to refresh research notes."
    end
  end
end

def setup_research(slug)
  md_path = research_source_path(slug)

  saved_key = File.exist?(RESEARCH_KEY_PATH)
  passphrase = saved_key ? File.read(RESEARCH_KEY_PATH).strip : ENV["RESEARCH_KEY"].to_s.strip
  if passphrase.empty?
    abort "error: #{RESEARCH_KEY_PATH} is empty" if saved_key
    abort "error: run setup in a terminal to enter the research passphrase" unless $stdin.tty?
    passphrase = $stdin.getpass("Research passphrase: ").to_s.strip
    abort "error: no research passphrase entered" if passphrase.empty?
  end

  plaintext = read_encrypted_source("#{md_path}.enc", passphrase)
  unless saved_key
    File.open(RESEARCH_KEY_PATH, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.puts(passphrase)
    end
  end
  install_research_hooks
  exit 1 unless refresh_research_source(slug, md_path, plaintext)
end

def research_source_path(slug)
  abort "error: invalid research slug" if slug != File.basename(slug) || [".", "..", ""].include?(slug)

  File.join(RESEARCH_DIR, slug, "_research.md")
end

def synced_research_source?(slug, md_path, local)
  baseline_path = "#{md_path}.synced"
  if File.exist?(baseline_path)
    return File.read(baseline_path) == Digest::SHA256.hexdigest(local)
  end

  # Adopt a copy decrypted before sync was introduced if it matches the pre-pull version.
  previous = research_git("show", "ORIG_HEAD:research/#{slug}/_research.md.enc")
  return false unless previous

  enc = parse_enc(previous)
  enc[:salt] == derive_salt(slug, local) && enc[:iv] == derive_iv(slug, local)
end

def refresh_research_source(slug, md_path, plaintext)
  local = File.binread(md_path) if File.exist?(md_path)

  if local == plaintext
    record_synced_source(md_path, local)
    return true
  end

  if !local || synced_research_source?(slug, md_path, local)
    latest_local = File.binread(md_path) if File.exist?(md_path)
    if latest_local == local
      save_decrypted_source(md_path, plaintext)
      return true
    end
  end

  warn "Kept research/#{slug}/_research.md because it differs from the last synced version. Move it aside before syncing, or merge your edits first."
  false
end

def sync_research(slug)
  slugs = if slug
            [slug]
          else
            Dir.glob(File.join(RESEARCH_DIR, "*", "_research.md.enc")).sort
              .select { |path| File.file?(path.delete_suffix(".enc")) }
              .map { |path| File.basename(File.dirname(path)) }
          end

  synced = slugs.map do |name|
    md_path = research_source_path(name)
    plaintext = read_encrypted_source("#{md_path}.enc", research_passphrase)
    refresh_research_source(name, md_path, plaintext)
  end
  exit 1 unless synced.all?
end
