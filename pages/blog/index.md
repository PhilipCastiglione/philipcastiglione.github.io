---
layout: page
title: Philip Castiglione – Blog
permalink: /blog/
---

# Management Blog

My personal thoughts about how to manage well. Mostly relevant to medium or larger organisations.

<div>
    {% for post in site.posts %}
        <div>
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            <p>{{ post.excerpt }}</p>
        </div>
    {% endfor %}
</div>