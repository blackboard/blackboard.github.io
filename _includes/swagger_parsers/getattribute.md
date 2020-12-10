{% assign attribute = site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method][include.attribute] %}

{% if include.type == "list" %}
    {% for value in attribute %}
* {{ value }}
    {% endfor %}
{% else %}
{{ attribute }}
{% endif %}