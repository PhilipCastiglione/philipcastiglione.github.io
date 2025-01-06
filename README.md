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

- [ ] tags vs categories

- [ ] design iteration

- [ ] Layout improvements & best practices
    - [ ] Accessibility
    - [ ] Unroll stuff - og still (the only) thing?
- [ ] SEO stuff
- [ ] analytics? maybe

- [ ] Update README

- [ ] remove unused pages/assets/images/stuff

- [ ] Improve home page

- [ ] Improve resume

- [ ] Improve management blog main page text

- [ ] bio (update config description, linkedin, resume, og:description)

- [ ] more content

- [ ] figure out post dates

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
- [ ] pagination
