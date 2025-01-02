---
layout: default
title: Philip Castiglione – Blog
permalink: /blog/
---

# Blog

<div>
    {% for post in site.posts %}
        <li>
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            {{ post.excerpt }}
        </li>
    {% endfor %}
</div>