---
layout: post
post_title: Performance Management Metrics
categories: blog management
---
> *“When a measure becomes a target, it ceases to be a good measure.” - [Goodhart’s Law](https://en.wikipedia.org/wiki/Goodhart%27s_law)*

**OKRs** and **KPIs** are (often confused or undifferentiated) approaches to setting quantitative targets and measuring individual and organisational performance.

Here's how I define and use these tools, to stop measurement going wrong.

## OKR

A tool used to drive behavioural change by focusing on quantifiable metrics.

It is preferable to make OKRs temporary since initiating behaviour change is the point. The longer they stick around, the less effective or meaningful they will be.

These should neither be organisation wide nor naively cascaded, because people at different levels in the organisation cannot influence the same things.

Don't use too many. A manager should be able to list theirs from memory.

## KPI

Metrics important to monitor in order to drive decisions.

KPIs are not temporary and should not be used to directly influence behaviour. They should be observed as a reflection of the result of changes only.

Unlike OKRs, personal incentives should **not** be driven by KPIs.

## Discussion

These are somewhat idiosyncratic definitions, below is why.

OKRs and KPIs can go wrong by being:

1. gameable
1. assigned to people with limited agency to achieve them
1. unclear, untargeted, or disconnected from reality

### Gameable Metrics

This point is the most dangerous. If a metric can be gamed, it will be. From what I have observed, essentially every metric can be gamed.

The longer a(n incentivised) metric exists, the more people will find ways to game it. This is not a question of cynicism or honour; people will always act in accordance with the incentives their environment creates.

Incentivising metrics also drives short-termism. Bringing future period benefit forward or sacrificing long term benefit for a short term boost are common tactics to achieve incentive maximisation (for bonuses or career progression).

> _Want fewer bugs and plan to count bug reports? No problem, we'll just make it harder for customers to submit reports. Or perhaps you can count open issues? Sure, we'll just auto-close stale but unfixed issues – based on some criteria that sounds totally reasonable. How about sales targets? Harder to create out of thin air? But pretty easy to manipulate closing dates and revenue milestones, pushing forward or backwards to maximize period based bonuses._
>
> _All of these examples are from real experience._

Gameability is fundamentally why OKRs should be temporary and why KPIs should not be directly incentivised.

This is a hard problem.

### Uncontrollable Metrics

Assigning an OKR to someone who feels disempowered to influence it is deeply demotivating.

One approach to resolving this is taking input from assignees about their OKRs during the design phase.

> _Management might fear the risk of individuals negotiating compromised (easy) targets, but this is an orthogonal concern to functionally unachievable targets._
>
> _Once the concept of an OKR is agreed then the target numbers can be negotiated, but if a manager tells you they can't influence the numbers you think they can, then you need to know that._
>
> _This approach leads to much greater buy in than top down assigned OKRs without consultation._

A similar mistake is to create an OKR notionally under control, but that in reality is mainly down to chance. A prime example is a raw revenue metric for a division whose financials are mostly driven by broad macroeconomic conditions.

The correction in this case is to use a market adjusted metric (eg. deliver x% **market-adjusted** revenue growth). Fair (appropriate, comparable) calculations for market values should be designed up front, not when the OKR is assessed.


### Vague & Abstract Metrics

Vague metrics simply fail to drive desired behaviour, or drive the wrong behaviour.

For software engineers in particular, the bigger a company gets, the more abstract and inaccurate measures of progress get.

The most common version of this:

[doing the actual work & the customers have a feature] → [story points burning down on a chart]

If you want story points burning down on a chart, all I have to do is influence points! During estimation, work, or after the fact. It's very disconnected from the goal (what are we actually building? did it work?)

Target the real thing. If someone wants to use story points to help manage their work, fine. But if you measure story points, then the fake thing becomes the focus.


### Who Should Care?

Should we expect everyone to care about OKRs? Have a big company meeting where we present the org-level or division level OKRs to everyone via slides. Probably not. They're a management tool.

In particular when people feel unable to meaningfully contribute to high level targets, mostly all this does is increase the sense of dissociation between management and team members. For some reason it's a common delusion amongst senior managers that this is either motivating or useful to individual contributors; in my experience it just makes senior management appear out of touch.

An even worse mistake, forcing people to pretend to care damages culture, relationships and will reduce respect for management. People generally don't want to be made to lie or be fake, so don't ask them to.
