# CLAUDE.md

Jekyll personal site, deployed by GitHub Pages from `master`. Ruby is pinned to
3.4.5 (`.ruby-version`); the bundle will not resolve on Ruby 4.x.

```sh
bundle exec jekyll serve -l
```

## Research pages

`research/<slug>/index.html` is **generated**. Never edit it by hand — your edit
will be overwritten. Edit `research/<slug>/_research.md` and regenerate:

```sh
bundle exec ruby _script/build-research.rb <slug>
```

The repo is public, so `_research.md` is gitignored — the generator encrypts it
client-side (AES-256-GCM, PBKDF2) into the committed `_research.md.enc` and into
`index.html` itself. It needs a passphrase: `RESEARCH_KEY` env var, else the
gitignored `.research-key` file at the repo root; the real passphrase lives in
a password manager, not in this repo. On a fresh clone, recover the markdown
from the committed `.enc` file:

```sh
bundle exec ruby _script/build-research.rb --decrypt <slug>
```

Commit `index.html` and `_research.md.enc`, never `_research.md`.

**Before writing or editing any research page, use the `research-page` skill.**
It carries the markdown conventions — callouts, legal quotes, checklists,
section ids and cross-references — that produce the callouts and the sidebar
contents. Plain markdown builds, but silently loses all of that.

Keep prose in the markdown. Presentation belongs in
`_script/research-template.html`, which all research pages share.

## Conventions

Files and directories starting with `_` are invisible to Jekyll at any depth —
that is how `_research.md`, `_artifacts/` and `_script/` stay unpublished. Do not
add an `exclude:` key to `_config.yml` to hide things: it replaces Jekyll's
default exclude list rather than extending it, which publishes the Gemfile.

Pages under `research/` are kept out of `sitemap.xml` by the `defaults:` block in
`_config.yml` and carry a `noindex` meta tag.
