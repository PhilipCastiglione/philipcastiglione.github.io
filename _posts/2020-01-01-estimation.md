---
layout: post
post_title: Estimation
categories: blog
tags: management process
excerpt: Estimation in the software industry is terrible! So why should it happen? And how much?
---

## It's Bad

Estimations in software development are bad and wrong and should be avoided as much possible and relied upon even less.

**Estimations end up defining achievement.**  
Estimates are made to fit deadlines (obviously the other way around would be better, but mostly doesn’t really occur). People then work to those estimates. Of course the estimate was just a guess. So the process of estimating has impacted your reality and this is probably for the worse.

**Estimations reduce velocity.**  
The primary cause of this is that when a task was estimated conservatively (or overestimated by mistake), generally people will make that estimate correct rather than delivering earlier. There are system incentives at play; mostly it is unwise for an IC to deliver shorter than their estimates, as it will lead them to be put in pressurised delivery conditions in the future. When a task is underestimated, it doesn't take less time! So there's no win.

**Estimations teach gaming metrics.**  
Further, in relation to quantifying progress with numbers they’re not really important as an individual contributor. I know after a given sprint without measuring anything how effective I was and what my rough velocity was, because I was there. The main outcome of using story points to [measure performance]({% post_url 2020-01-01-performance-management-metrics %}) is training people to game metrics and estimation.

**Estimates mislead.**  
Aggregating estimates and using them to make predictions is risky and potentially misleading. Teams and projects are not static; “80 story points” with some team/project combination 3 months ago provides little inference today.

## You Need Them Anyway

Despite their flaws from a bottom up perspective, estimations are nearly unavoidable because of what they provide.

Management needs to be able to make decisions about:

- people and resource allocation
- work prioritisation
- investment (such as hiring)

This is true at all levels of management, with less granularity and more focus on business strategy as you go up.

Having a sense of what work can/must be done, what benefits it will bring, and what it costs, is **so valuable** for these decisions, that we try and do it even though we can't do it well in this industry.

## Minimising The Damage

As a necessary evil estimation should be done thoughtfully and cautiously done: with regard to context (what are the bottlenecks on a given feature, how was the team different over different average velocities, etc.) and with respect paid to the inherent limitations.

I have worked in both no, low and high estimation environments. Where feasible, low estimation generally leads to better outcomes in most ways (especially velocity). No estimation can be even faster, but you lose all forward planning and reporting.

Just getting leads to do high level rough estimations of timeframes is probably the best case where you can get away with it. [More detail on how estimates fit into sprint ceremonies here.]({% post_url 2020-01-01-agile-ceremonies %})

In cases where more detailed estimation is unavoidable, guidelines are that they should be done:

- for the project, by experienced/senior people, at a high level
- for tasks, by the person who will do the task, to the level of detail necessary for the derisking / planning required
- relied upon as little as possible
- aggregated and used for planning as little as possible

> **Story Points vs Time**
> 
> Story points are supposed to account for complexity and uncertainty, or be independent of the team member doing the task. But in practice, they’re always converted into time for planning anyway, to make them useful. This makes them an unnecessary indirection. Simplify by using time-based estimates and adjusting for risk and uncertainty directly.

## Quibbles

Yes of course there are exceptions. Certain specific tasks are very well understood, have been done before by the same person doing them again, can be estimated accurately easily and so on. If this is a majority of the work in your organisation, or even a meaningful amount, then don't worry about estimation because you're at risk of automation and/or offshoring.