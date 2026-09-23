---
name: research-page
description: Create or update a research page on this site. Use whenever writing, editing, restructuring or publishing anything under research/ — writing up a research project, adding findings, revising a page, or regenerating one. Covers the markdown source, the callout/checklist conventions, the encrypted build step, and which files to commit.
---

# Research pages

Each page is markdown that gets compiled into a single self-contained, encrypted
HTML file. You write markdown; you never write HTML.

```
research/<slug>/
  _research.md      source of truth — the only file you author. Gitignored.
  _research.md.enc  encrypted source. Committed.
  index.html        generated, encrypted. Committed. Never hand-edit.
```

`<slug>` appears in the public URL and in the public repo, so keep it
non-sensitive: `driveway`, not `raheny-driveway`.

## Procedure

1. **Get the passphrase available.** The generator reads `RESEARCH_KEY`, else the
   gitignored `.research-key` at the repo root. On a fresh clone neither exists —
   ask the user for it, do not invent one, and do not print it.
2. **Recover existing sources if needed.** A fresh clone has no `_research.md`:
   `bundle exec ruby _script/build-research.rb --decrypt <slug>`
3. **Write or edit `research/<slug>/_research.md`** using the conventions below.
4. **Build:** `bundle exec ruby _script/build-research.rb <slug>` (omit the slug to
   build every page).
5. **Verify:** `bundle exec ruby _script/build-research.rb --check` exits 0 when
   every page matches its source.
6. **Commit `index.html` and `_research.md.enc`.** Never commit `_research.md`;
   `.gitignore` covers it, so do not force-add it.

## Markdown conventions

Plain markdown works. These conventions are what produce the callouts, the
sidebar contents and the stable cross-references.

| Write                         | Get                                             |
| ----------------------------- | ----------------------------------------------- |
| `# Title`                     | page heading (encrypted, not public)            |
| first paragraph after the `#` | the context dateline                            |
| `## 2. Regulations`           | section `sec-2`, listed in the contents sidebar |
| `### 2.1 Planning`            | subsection `sec-2-1`, **not** in the contents   |
| `### Group A — Steel sheds`   | subsection with a slugified id                  |
| `> [!KEY] optional label`     | green "✓ Key finding" callout                   |
| `> [!WARNING] optional label` | orange "⚠ Warning" callout                      |
| `> [!ACTION] optional label`  | blue "☐ Action" callout                         |
| `> [!LEGAL] citation text`    | monospace legal quote with that citation        |
| `- [ ] item`                  | checkbox, remembered in the reader's browser    |
| a table                       | wrapped so it scrolls on mobile                 |

Number the `##` and `###` headings. Numbered headings get `sec-N` / `sec-N-M`
ids, so `[§2.1](#sec-2-1)` stays stable and also works when reading the markdown
on GitHub. If you renumber sections, re-check every `§` link — a stale one points
silently at the wrong section.

A callout body follows blockquote rules: a blank line inside one needs its own
`>`. Headings render as literal text, so `**bold**` in a heading shows asterisks.

Put a callout where a reader needs to stop: the finding that changes the
decision, the trap that costs money, the thing to go and do. A page where
everything is a callout has no callouts.

## Writing guidance

The whole point of this format over a wall of markdown is that a reader can scan
it. Lead each page with a "Bottom line" section that answers the question. Use
tables for anything comparable across options. State what you could not verify in
its own section rather than hedging inline — there is a precedent for this in the
existing pages.

## Gotchas

- Editing `index.html` directly is always wrong. The next build overwrites it.
- The page shell — CSS, layout, unlock UI, table widths — lives in
  `_script/research-template.html` and is shared by every research page. Changing
  it changes all of them, and they all need rebuilding.
- Content is AES-256-GCM encrypted, so nothing in the committed HTML is readable
  without the passphrase, including headings and the contents list. Never
  reintroduce plaintext content into the template.
- WebCrypto needs a secure context: these pages work on `https://` and
  `localhost`, but not from a `file://` copy.
