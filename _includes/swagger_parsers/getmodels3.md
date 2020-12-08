<!-- Read the "required" array from Swagger for use later -->
{% assign required = site.data.swagger[page.swaggerfile]components.schemas[page.swaggerschema]required %}

<!-- Liquid chokes on the $ sign, so reference the variable instead -->
{% assign ref = "$ref" %}

<table>
    <thead>
    <tr><th>Name</th><th>Type</th><th>Description</th><th>&nbsp;</th></tr>
    </thead>
    <!-- For each property, get the name and type from the Swagger file -->
    {% for property in site.data.swagger[page.swaggerfile]components.schemas[page.swaggerschema]properties %}
        <tr>
            <!-- property[0] is the attribute name -->
            <td><code>{{ property[0] }}</code></td>
            <td>
            <!-- property[1] contains the attribute info -->
            <!-- If it's an object reference, insert just the object type -->
            {% if property[1].[ref] %}
            <code>object&#60;{{ property[1].[ref] | remove_first:'#/definitions/' }}&#62;</code>
            {% else %}
            <code>{{ property[1].type }}</code>
            {% if property[1].format %}
            <code>&#60;{{ property[1].format }}&#62;</code>
            {% endif %}
            {% endif %}
            </td>
            <td>
            <!-- If it's an enum, list the values before the description -->
            <!-- There are no enums in Concourse Swagger file so not tested -->
            {% if property[1].enum %}
            Values: 
                {% for value in property[1].enum %}
                <code>{{ value }}</code>
                {% endfor %}
            <br>
            {% endif %}
            {{ property[1].description }}
            </td>
            <td>
            {% if property[1].readOnly == true %}
            READ<br>ONLY
            {% endif %}

            <!-- Get the "required" attributes from the Swagger file -->
            {% for reqprop in required %}
                {% if reqprop == property[0] %}
                REQUIRED
                {% endif %}
            {% endfor %}
            </td>
        </tr>
    {% endfor %}
</table>