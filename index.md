---
layout: main
---


<div id="content">
    <section id="mainContent"> 
      <!--************************************************************************
    Main Blog content starts here
    ****************************************************************************-->
      <h1><!-- Blog title -->Welcome to the Developer Community!</h1>
      <p>The Blackboard Developer Community is the home for technically-minded developers and system administrators for Blackboard products. This is where we keep all of our official developer documentation. This site is separated by product, as you will see in the menu bar above. In addition, when you are on an article and you see the menu icon above the title, that means you can open a side menu to navigate through that section to find other documents. We also have a <a href="/search.html">search page</a> and a <a href="/sitemap.html">Sitemap</a> to help you find the documentation you are looking for.</p>
	  <p>This documentation is built dynamically based on the <a href="https://github.com/blackboard/blackboard.github.io" target="_blank">blackboard.github.io</a> repository, and as such, you can contribute documentation and make edits via standard pull requests. You can also report missing documentation or request changes using github issue reporting. We hope this helps you find the documentation you need, and helps us identify gaps and inconsistencies in our documentation. After all, we are here to make your life as a developer easy!</p>
	  <p>As always, if you have any questions, be sure to check out the <a href="/Contact.html">contact</a> page. We look forward to the continuation of successful integrations for our client, partner, and Open Innovation Initiative developers!</p>
	  <p>Happy Coding!</p>
	</section>
    <section id="sidebar"> 
      <!--************************************************************************
    Sidebar starts here. It contains a searchbox, sample ad image and 6 links
    ****************************************************************************-->
    <a href="/feed.xml"><img src="/images/rss-feed.png" alt="Orange circle with white rss feed icon" height="40px" width="40px" style="float: right; padding-top: 5px;" /></a>
    <h2>Dev Blogs</h2>
  
    <nav>
        <ul>
		  {% for post in site.posts limit:10 %}
			<li>
			  <a href="{{ post.url }}">{{ post.title }}</a>
			</li>
		  {% endfor %}
		</ul>
      </nav>
    </section>
  </div>
