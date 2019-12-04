# Changing the global navigation's menu
*Author: Scott Hurrey*
*Categories: []*
*Tags: ['css', 'customization', 'user experience', 'ux', 'user interface', 'themes', 'ui', 'brands and themes', 'brands', 'customisation', 'developer']*
---
From [Ester Muñoz Aparicio:](https://community.blackboard.com/people/emunoz)

Someone in today's admin hours was asking about changing the global nav's
background. I tried to search and post to the chat our mods but did not have
the time to do so properly, so here it is:

/*MYBLACKBOARD*/

/*flyout sidebar*/

.flyout-menu{

background-color: #E1E1E1;

border: 1px solid #E1E1E1;

}

.flyout-menu .mybb-tools{

background-color: #006DCC !important;

text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25) !important;

border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);

-moz-border-radius: 4px;

-webkit-border-radius:4px;

border-radius: 4px;

}

/*links*/

.flyout-menu a{

color: #0088CC !important;

}

.flyout-menu a:hover{

color: #333333 !important;

}

/*flyout title*/

.flyout-menu .accordion_toggle span, .flyout-menu .accordion_toggle:hover
span{

background-color: #FFFFFF;

color: #333333 !important;

}

/*flyout content area*/

.accordion_content{

background-color: #FFFFFF!important;

-moz-box-shadow: none !important;

-webkit-box-shadow: none !important;

box-shadow: none!important;

}

.accordion_content li a{

color: #0088CC;

font-size: 100%;

text-decoration: none;

}

/*Buttons in the bottom of globalnav*/

.bottom-buttons a:hover, .bottom-buttons a:focus{

background-color: #0088CC !important;

}

Added at themes.css will work within Learn, if you want it to look the same
when the user is visiting those global pages, you'll have to copy the code to
app_nav.css

Hope this helps!

Ester

This document was generated from the following discussion: [Changing the
global navigation's
menu](https://community.blackboard.com/thread/3533-changing-the-global-
navigations-menu)

