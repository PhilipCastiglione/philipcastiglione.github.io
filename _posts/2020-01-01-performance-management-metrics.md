---
layout: post
post_title: Performance Management Metrics
categories: blog
tags: management people
excerpt: “When a measure becomes a target, it ceases to be a good measure.” - Goodhart’s Law
---
> *“When a measure becomes a target, it ceases to be a good measure.” - [Goodhart’s Law](https://en.wikipedia.org/wiki/Goodhart%27s_law)*

**OKRs** (Objectives and Key Results) and **KPIs** (Key Performance Indicators) are oft confused approaches to setting quantitative targets and measuring individual and organisational performance.

Here's how I define and use them to avoid measurement going wrong.

## OKRs: Driving Behavior Change

OKRs should be targets designed to initiate behavior change.

- **Temporary by design:** OKRs should be time-limited. Once behavior changes, the metric loses relevance.
- **Targeted, not cascaded:** Different roles influence different outcomes; OKRs should reflect this. Avoid naive top-down cascades.
- **Important and few:** Don't use too many. A manager should be able to list theirs from memory.

## KPIs: Monitoring for Decision-Making

KPIs track metrics essential for decision-making, not behavior.

- **Persistent:** KPIs endure as consistent benchmarks.
- **Not directly incentivised:** Behavior and personal incentives should not directly be driven by KPIs.
- **Systemic reflection:** KPIs reflect the results of changes, not the means to drive them.

## Discussion

These are somewhat idiosyncratic definitions, below is why.

Incentivised metrics can go wrong by being:

1. Gameable
1. Uncontrollable
1. Vague or Abstract

### Gameable Metrics

This point is the most dangerous.

Metrics are inherently gameable. Over time, people optimise for incentives, not external outcomes. This isn’t necessarily dishonesty - it’s rational adaptation to the environment.

The longer an incentivised metric exists, the more people will find ways to game it.

Incentivising metrics also drives short-termism. Pulling benefit forward at long term expense is explicitly rewarded with bonuses and career progression.

> _Want fewer bugs and plan to count bug reports? No problem, we'll just make it harder for customers to submit reports. Or perhaps you can count open issues? Sure, we'll just auto-close stale but unfixed issues - based on some criteria that sounds totally reasonable._
> 
> _How about sales targets? Harder to create out of thin air right? But pretty easy to manipulate closing dates and revenue milestones, pushing forward or backwards to maximise bonuses._
>
> _These examples (and many more) are observations from real organisations._

Gameability is fundamentally why OKRs should be temporary and why KPIs should not be directly incentivised.

### Uncontrollable Metrics

Assigning targets beyond someone’s control is deeply demotivating.

One solution is to take input from assignees about their OKRs during the design phase.

> _Management might fear compromised (easy) targets, but this is an orthogonal concern to functionally unachievable targets._
>
> _Once an OKR goal is agreed then the numbers can be negotiated. But if a manager tells you they can't influence the numbers you think they can, you need to know that._

This approach leads to much greater buy-in than top down assigned OKRs without consultation.

Another mistake is to create an OKR notionally under control, but that in reality is mainly down to chance. A prime example is a raw revenue metric for a division with financials mostly driven by broad macroeconomic factors.

The correction in this case is to use a market adjusted metric (eg. deliver x% **market-adjusted** revenue growth). Fair (appropriate, comparable) calculations for metric targets should be designed up front, not when the OKR is assessed.

### Vague or Abstract Metrics

Unclear, untargeted metrics disconnected from reality fail to inspire or guide.

Often, the bigger a company gets, the more abstract and inaccurate measures of progress get. A common example for software engineers:

* [doing the actual work & the customers have a feature]

VS

* [story points burning down on a chart]

If you want story points burning down on a chart, all I have to do is influence points! During [estimation]({% post_url 2020-01-01-estimation %}), whilst working, or after the fact. It's very disconnected from the goal (what are we actually building? did it work?)

Target the real thing. If someone wants to use story points to help manage their work, fine. But if you measure story points, then the fake thing becomes the focus.

### Addendum: Who Should Care?

Should we expect everyone to care about OKRs? Hold a big company meeting where we present the org or division level OKRs to everyone via slides? Probably not. They're a management tool.

In particular when people feel unable to meaningfully contribute to stated targets, mostly all this does is increase the sense of dissociation between management and team members. There's an apparent perception amongst senior managers that this is either motivating or useful to individual contributors; in my experience it just makes senior management appear out of touch.

Worst of all, forcing people to pretend to care ("commit" to something they can't influence) damages culture, relationships and will reduce respect for management. People generally don't want to be made to lie or be fake, so don't ask them to.
