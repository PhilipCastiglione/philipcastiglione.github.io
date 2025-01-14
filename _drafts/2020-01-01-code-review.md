---
layout: post
post_title: Code Review
categories: blog
tags: management process
excerpt: TODO
---

### Usage

| **Code Review** | **No Review** |
| --- | --- |
| Reduces risk | Trust and autonomy |
| Sharing knowledge of codebase and changes | Higher velocity, smoother production & no bottleneck risk |
| Maintain high code quality and consistency |  |
| Growth opportunity for mentors and mentees |  |

On balance, the pros of having Reviews almost always come out ahead.

It’s feasible to have an exception for very small, risk free changes. However in general rushing out a small change, even a hotfix that seems obvious for a live bug, is discouraged. It’s the perfect time to make mistakes. Boyscouting however can probably occur without code review, if the code review is inconvenient for some reason.

### Best Practices

Descriptive titles on PRs

Why is the change occurring? 

If relevant, include a screenshot

Assigning reviewers based on an agreed approach (what approach?).

It shouldn’t need stating but no one should ever make someone feel bad with their review

Some percentage (how much?) of “Pair Reviews” where someone experienced reviews an MR with the author as backseat. This will help people learn what was unclear, how their code is received and how to perform reviews.

### Links

https://blog.pragmaticengineer.com/good-code-reviews-better-code-reviews/

https://stackoverflow.blog/2019/09/30/how-to-make-good-code-reviews-better/

https://blog.pragmaticengineer.com/pull-request-or-diff-best-practices/

https://www.raycast.com/blog/no-code-reviews-by-default