# README

This is the source code for my personal website.

Live at: https://philipcastiglione.com

I am using Jekyll for static site generation.

## Usage

Serve locally

```sh
bundle exec jekyll serve -l
```

Deploy by merging to master and pushing to GitHub.

## Sitemap

- [x] index
- [x] 404 page
- [x] Playbook
- [x] Blog (Writing/Thoughts about management)
    - [x] index
    - [x] example post ...
- [x] Tools
    - [x] Useful
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

- [ ] Make it look good, and well implemented
    - [ ] Design
        - [ ] Layout
            - [ ] header (logo, nav)
                - [ ] logo
                - [ ] nav
            - [ ] footer
                - [ ] sitemap
                - [ ] social links
                    - [ ] linkedin
                    - [ ] github
            - [ ] post
            - [ ] non-post pages
        - [ ] Typography
        - [ ] Color
        - [ ] Icons
        - [ ] Images
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
    - [ ] mobile

- [ ] remove unused assets/images

- [ ] look for more jekyll plugins (like, do i want jekyll sitemap and feed)
    - https://jekyllrb.com/docs/step-by-step/10-deployment/

- [ ] Layout improvements & best practices
    - [ ] Accessibility
    - [ ] Unroll stuff - og still (the only) thing?
- [ ] SEO stuff
- [ ] analytics? maybe

- [ ] Update README

- [ ] bio (update config description, linkedin, resume, og:description)
- [ ] update resume & make and attach pdf version

- [ ] Fill out content
