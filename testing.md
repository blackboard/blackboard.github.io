---
layout: noLayout
title: "testing"
id: test
categories: test
author: dave
permalink: /test
---
[
    {% for firstlevel in site.data.menu %}
        {% for secondlevel in firstlevel.sub_item  %}
            {% if secondlevel.url  %}
                {
                    "title" : "{{ secondlevel.submenu_item}}",
                    "url" :  "{{ secondlevel.url }}",
                    "desc" : "{{ secondlevel.submenu_item }}",
                    "target": "{{ secondlevel.target }}"
                },
            {% endif %}
            {% for thirdlevel in secondlevel.subsubmenu %}
                {% if thirdlevel.url  %}
                    {
                        "title" : "{{ thirdlevel.subsubmenu_item}}",
                        "url" :  "{{ thirdlevel.url }}",
                        "desc" : "{{ thirdlevel.subsubmenu_item }}",
                        "target": "{{ thirdlevel.target }}"
                    },
                {% endif %}
                {% for fourthlevel in thirdlevel.subsubmenu_content %}
                    {% if fourthlevel.url  %}
                        {
                            "title" : "{{ fourthlevel.subsubmenu_content_name}}",
                            "url" :  "{{ fourthlevel.url }}",
                            "desc" : "{{ fourthlevel.subsubmenu_content_name }}",
                            "target": "{{ fourthlevel.target }}"
                        },
                    {% endif %}
                {% endfor %}
            {% endfor %}
        {% endfor %}
    {% endfor %}
    {% for post in site.posts %}
    {
        "title" : "{{ post.title }}",
        "url" :  "{{ post.url }}",
        "desc" : "{{ post.title }}",
        "target": "_self"
    } 
    {% unless forloop.last %} ,{% endunless %}
{% endfor %}         
]