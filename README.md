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

```
research/<project-slug>/
  index.html     hosted at /research/<project-slug>/
  _artifacts/    stored in git, never published
```

`index.html` must have **no YAML front matter**. Jekyll then copies it through
byte-for-byte: no layout, no site styling, and no Liquid processing (so `{{ }}`
and `{% %}` in scripts or content are safe). Adding front matter turns Liquid
back on and can break the page.

Anything that shouldn't be hosted goes in `_artifacts/` — Jekyll skips
underscore-prefixed directories at any depth. A loose `.md` file next to
`index.html` _would_ be published, as raw markdown.

Keep these out of search results with `<meta name="robots" content="noindex,
nofollow">` in the `<head>`. The `defaults:` block in `_config.yml` already
keeps everything under `research/` out of `sitemap.xml`.
