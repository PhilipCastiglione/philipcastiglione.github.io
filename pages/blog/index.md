---
layout: page
title: Philip Castiglione – Blog
permalink: /blog/
---

# Blog

<div>
    {% for post in site.posts %}
        <div>
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            {{ post.excerpt }}
        </div>
    {% endfor %}
</div>