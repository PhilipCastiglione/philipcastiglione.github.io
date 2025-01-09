---
layout: post
post_title: Agile Ceremonies
categories: blog
tags: management process
excerpt: How to make the most of agile and avoid some of the pitfalls.
---

Agile methodologies (e.g., Scrum, Kanban, XP, SAFe) involve specific ceremonies or meetings to structure work. Here’s how to make the most of them.

### Backlog Refinement / Grooming

**Purpose:** Ensure the backlog contains actionable (sufficiently defined), prioritised, and [estimated]({% post_url 2020-01-01-estimation %}) work.

**Attendees:**  
- Team & Project Leads, Project/Production Managers
- Ideally also ticket sponsors/work sources (though this rarely happens)
- (Optional) Individual Contributors if the Leads can't make decisions without them

**Key Outcomes:**  
- [Estimated]({% post_url 2020-01-01-estimation %}) and prioritised new tickets
- Requested clarification on poorly defined tickets (from the orginator)

**Tips:**  
- [Estimations]({% post_url 2020-01-01-estimation %}) at this stage should be high level, just enough to prioritise based on effort/value
- Prioritise at a high level based on the "Urgent-Important" Eisenhower matrix
- Ticket detail depends on team norms but must be sufficient to start work and/or have clear direction for discovery
- Avoid overloading tickets with excessive structure (a good example of “fake work”)
- For non Kanban teams: either keep it brief, or run less often than sprintly

### Sprint Planning

**Purpose:**  
- Enable effective sprints for team members
- Inform project and roadmap planning

**Attendees:** The team.

**Key Outcomes:**  
- Team members understand what they’ll work on and potential dependencies they have or are (especially external ones)
- Expectations for the work to be completed in the sprint are established
- High level [estimates]({% post_url 2020-01-01-estimation %}) from leads are adjusted collaboratively with team members

> **Sprint Goals**
> 
> In my experience these are not useful or effective, but rather create a misleading loop of busywork and low value reporting information. Non-managers are not actually motivated at all by these and only care about them so long as it takes to agree them during a meeting.
> 
> Same concern with emphasising “ownership” and “commitment”! These only add pressure to uncertainty, which pushes people to be more conservative in what they aim for. These lower velocity for no real gain in predictability. This is not how to motivate.

### Daily Standup

**Purpose:** Facilitate daily work and ensure the team is running well.

**Attendees:** The team.

**Key Outcomes:**  
- Foster social connection (especially critical for remote teams)
    - Maybe the most important bit. Even a 5-10 minute "hello" meeting to just say hi is valuable
- Create visibility for the Team Lead into progress
- Surface blockers or dependencies
    - Honestly I don’t think this is great, who is waiting until standup to call out these things instead of in real time as encountered? Why?

**Tips:**  
- Succinctness is key - often most people don’t care about most things being said so long updates tune people out
- Should **NOT** become a “prove you’re working” session

### ~~Sprint~~ Product Review

**Purpose:** Inform, connect and motivate.

**Attendees:** Everyone working on the same product.

**Key Outcomes:**  
- Keep everyone engaged on and informed about the product
- Celebrate progress

**Tips:**  
- These work well when run less often (eg. quarterly) for the broader group and are focused on highlights and direction
- A good time to bring up product focused feedback and learnings
- Each team should have their work highlighted

### Sprint Retrospective

**Purpose:** Improve and maintain team health and function.

**Attendees:** The Team.

**Key Outcomes:**  
- Capture the team's current state of being
- Generate suggestions & actions for improvement
- Celebrate what is going well

**Tips:**  
- Sprintly can be too often if feedback isn't actionable fast enough or if things are going smoothly
- Structure is useful (example below) but the Lead should actively run these and not have them be overly process driven
- Prompters for stuck teams: consider framing feedback around "culture", "team", "process", "tools", "tech" or "argh".

**Retro 101 Example Structure:**  
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

### Feature Kickoffs

**Purpose:** Facilitate successful feature development.

**Attendees:** The feature/project team, and stakeholders.

**Key Outcomes:**  
- Align the team on the new feature
- Surface information gaps and dependencies
- Identify risks and concerns

**Tips:**  
- Include stakeholders so they can explain things in their own words and answer questions
- It is essential to identify risks and concerns from the people doing the work, but if there are senior stakeholders in the room, contributors might be hesitant. It is the Lead/PMs job to ensure this happens (safely).
