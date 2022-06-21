---
layout: post
title: "Golang Demo"
id: rest_apis-learn-examples-golang_demo
categories: Learn Rest
author: Scott Hurrey
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes:
    - \usepackage{fvextra}
    - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
    - \usepackage[obeyspaces,spaces,hyphens]{xurl}
---
<div>&nbsp;</div>
{% assign sluggedName = page.name | replace: '.md' %}
<div class="download-btn-placement"><br>modified: {{ page.last_modified_at | date: '%b-%d-%y' }} &nbsp;&nbsp; 
<a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a></div>


# Demo using Golang

In August 2016, our friends at [AllTheDucks](https://www.alltheducks.com) presented on their work integrating with the Learn REST APIs using [Golang](https://golang.org).

Following DevCon ANZ, the Ducks were kind enough to open source their project and write a blog to help developers learn the Golang REST Application they wrote.

The blog can be found [here](https://www.alltheducks.com/blog/using-the-learn-rest-api-from-golang).