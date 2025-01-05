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

## Reference

* https://github.com/mmistakes/minimal-mistakes/tree/master/

## TODO


- [ ] add a bit of basic content
    - [ ] one more management blog posts
    - [ ] replace resume

- [ ] Make it look good, and well implemented
    - [ ] Mobile, Tablet, Laptop, Large Screen

- [ ] go live

- [ ] look for more jekyll plugins (like, do i want jekyll sitemap and feed)
    - https://jekyllrb.com/docs/step-by-step/10-deployment/

- [ ] tags vs categories

- [ ] use better linking https://jekyllrb.com/docs/liquid/tags/#link

- [ ] design iteration

- [ ] Layout improvements & best practices
    - [ ] Accessibility
    - [ ] Unroll stuff - og still (the only) thing?
- [ ] SEO stuff
- [ ] analytics? maybe

- [ ] Update README

- [ ] Improve home page

- [ ] Improve management blog main page text

- [ ] remove unused pages/assets/images/stuff

- [ ] bio (update config description, linkedin, resume, og:description)
- [ ] update resume & make and attach pdf version

- [ ] Fill out content

- [ ] post dates

- [ ] cross link posts

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

- [ ] emr: all the source links are broken
