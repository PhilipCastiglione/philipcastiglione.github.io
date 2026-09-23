# README

This is the source code for my personal website.

Live at: https://philipcastiglione.com

## Usage

Serve locally:

```sh
bundle exec jekyll serve -l
```

Deploy by merging to master and pushing to GitHub.

## Research projects

Write markdown; the HTML is generated. Never hand-edit the HTML.

This repo is public, so research content is never committed in plaintext.
`index.html` embeds it as AES-256-GCM ciphertext, decrypted client-side by a
passphrase the reader supplies.

```
research/<project-slug>/
  _research.md      source of truth — the only file you edit, gitignored
  _research.md.enc  GENERATED, committed — encrypted _research.md
  index.html        GENERATED, committed, served at /research/<project-slug>/
  _artifacts/       optional, for other stored files
```

Regenerate after editing the markdown:

```sh
bundle exec ruby _script/build-research.rb <project-slug>   # or no args for all
bundle exec ruby _script/build-research.rb --check          # exit 1 if stale
```

The passphrase comes from the `RESEARCH_KEY` env var, else the gitignored
`.research-key` file at the repo root; it lives in a password manager. A
fresh clone has neither `_research.md` nor `.research-key` — recover the
markdown from the committed `.enc` file once you have the passphrase:

```sh
bundle exec ruby _script/build-research.rb --decrypt <project-slug>
```

Output is committed because GitHub Pages builds with its own fixed gem set and
cannot run a custom plugin. Same markdown in, byte-identical HTML out.

Jekyll skips anything whose name starts with `_`, at any depth, so `_research.md`,
`_artifacts/` and `_script/` never reach the built site. That is also why there is
no `exclude:` key in `_config.yml` — adding one _replaces_ Jekyll's defaults rather
than extending them, which would publish the Gemfile.

### Markdown conventions

Callouts, legal quotes, checklists, section ids and `§` cross-references are
documented in `.claude/skills/research-page/SKILL.md`, which is also what agents
working in this repo load. Kept in one place so the two cannot drift.

The generated page carries `<meta name="robots" content="noindex, nofollow">`,
and the `defaults:` block in `_config.yml` keeps `research/` out of `sitemap.xml`.
