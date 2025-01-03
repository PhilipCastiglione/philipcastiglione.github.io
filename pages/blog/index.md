---
layout: page
title: Philip Castiglione – Blog
permalink: /blog/
---

# Blog

_Disclaimer: this is targeted at medium to large organisations; big enough that people on the coalface feel disconnected from leadership._

<div>
    {% for post in site.posts %}
        <div>
            <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
            {{ post.excerpt }}
        </div>
    {% endfor %}
</div>