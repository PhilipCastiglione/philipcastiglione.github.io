---
layout: post
post_title: Agile Ceremonies
categories: blog management
excerpt: How to make the most of agile and avoid some of the pitfalls.
---

Assuming you're using some Agile methodology with these common team or project level meetings, here are some guidelines about how to use them well.

Your specific Agile framework (eg Scrum, Kanban, Extreme Programming (XP), SAFe, something else...) might have slightly different ceremonies or names.

### Backlog Refinement / Grooming

Purpose: to ensure that the backlog has the correct work (eg "tickets/cards/stories etc") in it.

- correct → prioritised, (roughly) estimated, sufficiently defined

Attendees: Team & Project Leads, Project/Production Managers

- Ideally also ticket sponsors/work sources (but this rarely happens)
- Individual Contributors optional unless Team Lead can't make decisions without them

During the meeting:

- Estimate (high level) and prioritise new tickets
- Flag poorly defined tickets

Post-meeting actions:

- Request more detail on poorly defined tickets (from whence they came), or they won't get done

Prioritise at a high level based on the "Urgent-Important" Eisenhower matrix.

Required ticket detail:

- Depends on team norms but must be sufficient for someone to start a task and/or have clear direction for discovery
- Don't fall into the trap of requiring huge amounts of formally structured information on every ticket; leads to excessive fake work

Estimations at this stage should be high level, just enough to prioritise based on effort/value.

If you're not doing Kanban: this should either be a short meeting, or better, run less often than sprintly.

### Sprint Planning

Purpose:

- enable effective sprints for team members
- identify task dependencies and required actions around them
    - watch out in particular for dependencies external to the team
- inform project and roadmap planning

Team members should know what they expect to work on, what dependencies they have, what they are dependencies for and have some rough guess about where they expect their tasks to end up.

If at this stage you have high level ticket estimates made by (eg.) the team lead then this is the time to discuss and negotiate estimates with the individuals doing the work.

> **Sprint Goals**
> 
> I don’t believe these are useful or effective, but rather create a misleading loop of busywork and low value reporting information. Non-managers are not actually motivated at all by these and only care about them so long as it takes to agree them during a meeting.
> 
> Same concern with emphasising “ownership” and “commitment”! These only add pressure to uncertainty, which pushes people to be more conservative in what they aim for. These lower velocity for no real gain in predictability. This is not how to motivate.

### Daily Standup

Purpose:

- A small opportunity for social connection and seeing everyone's faces
    - Reduces the risk of disconnectedness. Especially critical in remote teams.
    - This is honestly the most important bit. I'm even open to a 5-10 minute hello meeting that *isn’t* a "standup", where people don’t talk about what they’re working on, just say hi.
- Create visibility for the Team Lead into what everyone is doing and where they’re at
    - An alternative is proactive Team Leadership where the lead actively checks in with individuals/projects throughout the week.
- Provide an opportunity to call out blockers or dependencies
    - Honestly I don’t think this is great, who is waiting until standup to call out these things instead of in real time as encountered? Why?

Succinctness is key; often most people don’t care about most things being said, so there’s a big risk of everyone tuning out.

Should **NOT** become a “prove you’re working” meeting.

### Sprint Review

Purpose: focus on the product - what changed in the product over the sprint, what impacts there were.

A good time to bring up product focused feedback and learnings.

I like these, as long as the audience is chosen correctly ... and they don't occur every sprint. I actually rename these something like Product Review and prefer them run less often.

If you're also doing project level reviews, these should be run rarely (eg. quarterly) and only include highlights.

### Sprint Retrospective

Purpose: focus on processes & the team; review the experience of working over the last sprint.

Essentially a self-evaluation - how are we doing.

Sprintly can sometimes be too often, if feedback isn't actionable fast enough or if there isn't much actionable feedback (often because things are going well).

Structure is useful (example below) but the Lead should actively run these and not have them be overly process driven.

**Retro 101**

1. Brief agenda/reminder
1. For each of [Start], [Stop], [Continue]
    1. Everyone writes cards
    1. Everyone votes on cards
        - votes should be things you want to talk or hear more about, not just things you agree with
        - it's over the top, but if a team wants, they can have two types of votes ("agree" & "discuss")
    1. Talk through cards in order of votes (time constrained)
    1. Define Actions (or take on notice to think about)
1. Celebrations
1. Culture/sentiment/safety checkin
1. Relevant Announcements (eg. enacted Actions)

---

Prompter lenses that can be useful when you're not getting good cards or people are stuck (but could limit thinking):

- culture
- team
- process
- tech
- tools
- argh

### Bonus: Feature Kickoffs

Purpose:

- get everyone across a new feature that they will be working on
- find information gaps; things that will impede planning
- identify (eg. cross-team) dependencies
- flag concerns

These should include feature/project stakeholders so they can explain things in their own words and answer questions.
