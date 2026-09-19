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

```
research/<project-slug>/
  _research.md    source of truth — the only file you edit
  index.html      GENERATED, committed, served at /research/<project-slug>/
  _artifacts/     optional, for other stored files
```

Regenerate after editing the markdown:

```sh
bundle exec ruby _script/build-research.rb <project-slug>   # or no args for all
bundle exec ruby _script/build-research.rb --check          # exit 1 if stale
```

Output is committed because GitHub Pages builds with its own fixed gem set and
cannot run a custom plugin. Same markdown in, byte-identical HTML out.

Jekyll skips anything whose name starts with `_`, at any depth, so `_research.md`,
`_artifacts/` and `_script/` never reach the built site. That is also why there is
no `exclude:` key in `_config.yml` — adding one _replaces_ Jekyll's defaults rather
than extending them, which would publish the Gemfile.

### Markdown conventions

| Write                         | Get                                             |
| ----------------------------- | ----------------------------------------------- |
| `# Title`                     | page heading and `<title>`                      |
| first paragraph after the `#` | the context dateline                            |
| `## 2. Regulations`           | section `sec-2`, listed in the contents sidebar |
| `### 2.1 Planning`            | subsection `sec-2-1`, **not** in the contents   |
| `### Group A — Steel sheds`   | subsection with a slugified id                  |
| `> [!KEY] optional label`     | green "✓ Key finding" callout                   |
| `> [!WARNING] optional label` | orange "⚠ Warning" callout                      |
| `> [!ACTION] optional label`  | blue "☐ Action" callout                         |
| `> [!LEGAL] citation text`    | monospace legal quote with that citation        |
| `- [ ] item`                  | checkbox, remembered in the browser             |
| a table                       | wrapped so it scrolls on mobile                 |

Numbered headings get `sec-N` / `sec-N-M` ids, so cross-references are stable:
write `[§2.1](#sec-2-1)`, which also works when reading the markdown on GitHub.

Callout bodies follow blockquote rules — a blank line inside one needs its own
`>`. Headings are plain text, so `**bold**` in a heading shows the asterisks.

The generated page carries `<meta name="robots" content="noindex, nofollow">`,
and the `defaults:` block in `_config.yml` keeps `research/` out of `sitemap.xml`.
