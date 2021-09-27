---
layout: blog
id: blog-home
title: Blog
toc: false
permalink: /blog-home
---
<h1>Developer Blog</h1>

<div id="content">
    
    <h2>Latest Posts</h2>

    <div class="row">
        {% for post in site.posts %}
            {% include card.html %}
        {% endfor %}
    </div>
    
</div>