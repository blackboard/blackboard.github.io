---
layout: post
title: "Blackboard Dev Docs"
purple-text-title: "Welcome to the Blackboard Dev Docs Site!"
author: Scott Hurrey
toc: false
---
# Welcome to our New Site!

<div id="content">
    <section id="mainContent"> 


<p>The Blackboard Developer Community is the home for technically-minded developers and system administrators for Blackboard products. This is where we keep all of our official developer documentation. This site is separated by product, as you will see in the menu bar to the left of this text.</p> 

<p>You will also notice that most pages have the table of contents in a third column on the right hand side of the content. This table of contents moves with you as you move through the content, making it super-easy for you to move around the documentatation and find exactly what you are looking for.</p>

<p>We also have a fantastic search option, accessible from anywhere. Simply click the magnifying glass icon at the top right and you will be taken to the search page.</p>

<p>This documentation is built dynamically based on the <a href="https://github.com/blackboard/blackboard.github.io">blackboard.github.io</a> repository, and as such, you can contribute documentation and make edits via standard pull requests. You can also report missing documentation or request changes using github issue reporting. We hope this helps you find the documentation you need, and helps us identify gaps and inconsistencies in our documentation. After all, we are here to make your life as a developer easy!</p>

<p>As always, if you have any questions, be sure to check out the <a href="community/contact">contact page</a>. We look forward to the continuation of successful integrations for our client, partner, and Community Partner developers!</p>

<p>Happy Coding!</p>
	</section>
    <section id="sidebar"> 
    
    <a href="/feed.xml"><img src="/assets/img/rss-feed.png" alt="Purple circle with white rss feed icon" height="40px" width="40px" style="float: right; padding-top: 5px;" /></a>

    <h2 style="margin-top: -10px; margin-bottom: -10px;">Dev Blogs</h2>
  
    <ul>
        {% for post in site.posts limit:10 %}
        <li>
            <a href="{{ post.url }}">{{ post.title }}</a>
        </li>
        {% endfor %}
    </ul>
    </section>
  </div>
