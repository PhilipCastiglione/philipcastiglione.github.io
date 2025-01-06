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

- [ ] Improve home page

- [ ] Improve resume

- [ ] Improve management blog main page text

- [ ] bio (update config description, linkedin, resume, og:description)

- [ ] more content

- [ ] implement post dates approach
    - pick a posting frequency, go backwards and some amount forwards at approximately that frequency? posts that seem better should be now

- [ ] group by tags, incorporate into blog index, make them clickable 

- [ ] design iteration

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

- [ ] do something with categories?

- [ ] analytics? maybe