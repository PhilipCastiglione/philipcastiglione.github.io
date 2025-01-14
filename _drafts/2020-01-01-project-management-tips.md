---
layout: post
post_title: Project Management Tips
categories: blog
tags: management process
excerpt: TODO
---

### Requirements

Watch out for "the blessed requirement" - requirements are not necessarily correct and never perfect. They’re just generally someone else’s best guess at what would be good. They have different granularities, which might be wrong, they might lead to system with flaws. They have gaps. They are fungible, can often be improved or clarified. ICs should NOT treat them as written in stone, but rather a guess and a negotiation
 (ref: https://www.youtube.com/watch?v=EZ05e7EMOLM)

### Tech Plans

- Should be done for changes of certain complexity, or touching unfamiliar or complex areas
- Both Tech Plan detail and Review depth appropriate to complexity; not overly process driven
- Checklist to assist people in what should be in the plan, all items optional and can be included as judged useful

<aside>
❓ need example checklist items

</aside>

### Definition of Done

- Avoid the risk of building things quickly and then finishing them with bug tickets. You only pretended it was done.

### Meetings

- These are a balancing act.
- They do provide human contact and much more efficient (sync) collaboration.
- Ad hoc (zoom) meetings are great, they can be 5 mins and make loads of progress.
- People (developers) get most aggravated about meetings that they didn’t need to be in, or that had 1 or 2 relevant moments across 30+ minutes.
- Avoid this -> Meeting bloat; "we should be involved in that too". Getting the right level of involvement from the key stakeholders at the right time, is an art...

### Dependencies

- Don't tie the success of your organisation/release/project to the performance of actors external; an example of where this can go wrong is the THQ <> CA <> 3rd party inter-reliance on the 1 jan release. Thinking early about project/release/target separation; feature/customer/dev toggle etc.
- Tracking specifically external dependencies (in any form) is essential to project success; deadlines, pressure etc is almost always most directly related to these things.
- Iteration in the context of reliance on an external data source with limited write access - it's hard