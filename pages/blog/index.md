---
layout: page
title: Philip Castiglione - Blog
permalink: /blog/
---

My personal thoughts about how to run the operations of a tech company well. Mostly relevant to medium or larger organisations. Experiences are from leading engineers, leading leads, improving processes, managing people, significant tech stack and architecture decisions.

In the future I might work more into strategy, policy and higher level organisational design.

---

<div>
    {% for post in site.posts %}
        <div>
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>{{ post.excerpt }}</p>
        </div>
    {% endfor %}
</div>