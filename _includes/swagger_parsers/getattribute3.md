{% assign attribute = site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method][include.attribute] %}

File: 
* {{ page.swaggerfile }}
* {{ site.data.swagger[page.swaggerfile] }}

Path: 
* {{ page.swaggerkey }}
* {{ site.data.swagger[page.swaggerfile]paths[page.swaggerkey] }}

Method: 
* {{ page.method }}
* {{ site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method] }} 

{% if include.type == "list" %}
    {% for value in attribute %}
* {{ value }}
    {% endfor %}
{% else %}
{{ attribute }}
{% endif %}