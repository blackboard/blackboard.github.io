---
title: POST /sessions
swaggerfile: collab
swaggerkey: /sessions
swaggerschema: SessionDetails
method: post
layout: post
title: POST /sessions
id: collab-api-ref-post-session
categories: Collaborate
toc: true
---

# POST /sessions

## Description
This is the schema definition for POST /sessions, generated dynamically from the swagger.yml file.

## Query Parameters
{% include swagger_parsers/getparams3.md %}

## Request
{% include swagger_parsers/getmodels3.md %}

## Response
{% include swagger_parsers/getresponses3.md %}

## Examples

<p>Click on the buttons inside the tabbed menu:</p>

<div class="tab">
  <button class="tablinks active" onclick="openLang(event, 'cURL')">cURL</button>
  <button class="tablinks" onclick="openLang(event, 'Python')">Python</button>
  <button class="tablinks" onclick="openLang(event, 'C#')">C#</button>
</div>

<div id="cURL" style="display: block;" class="tabcontent active">
  <h4>cURL</h4>
  <code>curl bah blah blah</code>
</div>

<div id="Python" class="tabcontent">
  <h4>Python</h4>
  <code>if python == True:
        print("Woohoo!")</code> 
</div>

<div id="C#" class="tabcontent">
  <h4>C#</h4>
  <code>if(C#) {
      print(":)");
  }</code>
</div>

<br />

<script>
function openLang(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>