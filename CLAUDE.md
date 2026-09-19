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

Adding research: create `research/<slug>/_research.md`, run the generator, and
commit both files. The markdown conventions — callouts, legal quotes,
checklists, section ids and cross-references — are documented under "Research
projects" in README.md. Read that before writing a research page; plain markdown
works, but the conventions are what produce the callouts and the sidebar
contents.

Keep prose in the markdown. Presentation belongs in
`_script/research-template.html`, which all research pages share.

## Conventions

Files and directories starting with `_` are invisible to Jekyll at any depth —
that is how `_research.md`, `_artifacts/` and `_script/` stay unpublished. Do not
add an `exclude:` key to `_config.yml` to hide things: it replaces Jekyll's
default exclude list rather than extending it, which publishes the Gemfile.

Pages under `research/` are kept out of `sitemap.xml` by the `defaults:` block in
`_config.yml` and carry a `noindex` meta tag.
