# README

This is the source code for my personal website.

Live at: https://philipcastiglione.com

I am using Jekyll for static site generation.

## Usage

Serve locally

```sh
bundle exec jekyll serve -l
```

Deploy

```sh
bundle exec jekyll build
...?
```

## Sitemap

- [x] index
- [x] 404 page
- [x] Tools
    - [x] Useful
- [x] Playbook
- [x] Blog (Writing/Thoughts about management)
    - [x] index
    - [x] example post ...
- [x] Resume
    - [x] page version
    - [x] as pdf
- [ ] Personal
    - [x] index
    - [x] Wedding stuff
    - [ ] Health
    - [ ] Other Interests...
    - [ ] CCN
    - [ ] Dreams
    - [ ] Trivia
    - [ ] Writing
    - [ ] Game Dev
    - [ ] Self Development

## Reference

* https://github.com/mmistakes/minimal-mistakes/tree/master/

## TODO

- [ ] Get some initial content for the sitemap sections
    - [ ] files w/ content
    - [ ] nav
- [ ] Deal with the other stuff?
    - [x] favicon
    - [ ] fix the public links and warnings..?
    - [ ] public / assets (test in prod)
    - [ ] og image tags
- [ ] Create a branch and make a commit
- [ ] Make it look good
    - [ ] Theming

- [ ] Set defaults in _config.yml
    - eg.
    ```yaml
    defaults:
    # _posts
    - scope:
        path: ""
        type: posts
      values:
        layout: single
        read_time: true
        comments: true
        share: true
        related: true
    ```
    - ref: https://mmistakes.github.io/minimal-mistakes/docs/installation/

- [ ] Get deployed
    - [ ] get back on main branch
    - https://docs.github.com/en/pages/quickstart

- [ ] Update README
- [ ] Fill out content

- [ ] Layout improvements & best practices
    - [ ] Accessibility
    - [ ] Unroll stuff - og still (the only) thing?
- [ ] SEO stuff
- [ ] analytics? maybe
- [ ] look for more jekyll plugins (like, do i want jekyll sitemap and feed)
    - https://jekyllrb.com/docs/step-by-step/10-deployment/
- [ ] social links
- [ ] bio (update config description)
- [ ] linkedin
- [ ] resume
- [ ] remove unused assets/images
