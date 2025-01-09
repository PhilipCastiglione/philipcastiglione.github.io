---
layout: post
post_title: Technology Choices
categories: blog
tags: management tech
excerpt: A few quick principles and tips to guide technology and design choices.
---
### Core Principles

- Simplicity over almost everything
- The principle of least surprise
- Obvious over clever
- Code functionality and features for today, maybe tomorrow, but not “the future”
- Time saved with shortcuts cost 5x the velocity
- Functionality is an asset, code is a liability

### Tips

- Use auto linting tools, never argue about style
- CI pipelines are your friend for enforcing standards
- Just have all your data as well organised and as accessible as possible and have a few data scientists and analysts. Don’t build a billion platforms.
- [workplace] lesson → CI pipeline 1:1 vcs (eg git) repo
- Monolith codebases are better in a lot of ways than distributed services. Think hard about the costs of separations and have very good reasons for doing so. Costs are in every integration point, every cross boundary test, every duplicated model, every cross boundary communication that could have been a function call...
- Redis, AWS etc do fail. We get some form of it quite often at [workplace]
- The easiest and most powerful choice is to simplify infrastructure, fewer moving parts means fewer points of failure
- Before you introduce something, consider how you are going to monitor it
- Code should explain what, comment the "why" (when it's inobvious)
- The more distant/external the consumer, the harder to change the API/interface
