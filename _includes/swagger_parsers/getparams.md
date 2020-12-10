<!-- Liquid chokes on the $ sign, so reference this variable instead -->
{% assign ref = "$ref" %}

<!-- Determine if there are any parameters of the specified type -->
{% assign hasparams = false %}
{% for parameter in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]parameters %}
    {% if parameter.in == include.paramtype %}
        {% assign hasparams = true %}
    {% endif %}
{% endfor %}

{% if hasparams == true %}
{% if include.paramtype == "body" %}
    {% for parameter in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]parameters %}
        {% if parameter.in == "body" %}
{{ parameter.description }}
        {% endif %}
    {% endfor %}
<table>
    <thead>
    <tr>
        <th>Name</th><th>Type</th><th>Description</th><th>Required?</th>
    </tr>
    </thead>
    <!-- For each parameter, get the name and type from the Swagger file -->
    {% for parameter in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]parameters %}
        {% if parameter.in == "body" %}
        <!-- Read body parameters from the specified resource model -->
            {% if parameter.schema.type == "array" %}
                {% assign request = parameter.schema.items[ref] | remove_first:'#/definitions/' %}
            {% else %}
                {% assign request = parameter.schema[ref] | remove_first:'#/definitions/' %}
            {% endif %}
            <!-- Read the "required" array from Swagger for use later -->
            {% assign required = site.data.swagger[page.swaggerfile]definitions[request]required %}
            {% for param in site.data.swagger[page.swaggerfile]definitions[request]properties %}
            <tr>
                <td><code>{{ param[0] }}</code></td>
                <td>
                {% if param[1].[ref] %}
                <code>object&#60;{{ param[1].[ref] | remove_first:'#/definitions/' }}&#62;</code>
                {% else %}
                <code>{{ param[1].type }}</code>
                {% if param[1].format %}
                <code>&#60;{{ param[1].format }}&#62;</code>
                {% endif %}
                {% endif %}
            </td>
                <td>
                <!-- If it's an enum, list the values before the description -->
                {% if param[1].enum %}
                Values: 
                    {% for value in param[1].enum %}
                    <code>{{ value }}</code>
                    {% endfor %}
                <br>
                {% endif %}
                {{ param[1].description }}
                </td>
                <td>
                {% if property[1].readOnly == true %}
                READ<br>ONLY
                {% endif %}
                <!-- Get the "required" attributes from the Swagger file -->
                {% for reqprop in required %}
                    {% if reqprop == param[0] %}
                    REQUIRED
                    {% endif %}
                {% endfor %}
                </td>
            </tr>
            {% endfor %}
        {% endif %}
    {% endfor %}
</table>

{% else %}
<!-- Read path, query, and formData parameters directly -->
<table>
    <thead>
    <tr>
        <th>Name</th><th>Type</th><th>Description</th><th>Required?</th>
    </tr>
    </thead>
    <!-- For each parameter, get the information from the Swagger file -->
    {% for parameter in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]parameters %}
        {% if parameter.in == include.paramtype %}
        <tr>
            <td><code>{{ parameter.name }}</code></td>
            <td><code>{{ parameter.type }}</code></td>
            <td>
            <!-- If it's an enum, list the values first -->
            {% if parameter.enum %}
            Values: 
                {% for value in parameter.enum %}
                <code>{{ value }}</code>
                {% endfor %}
            <br>
            {% elsif parameter.items.enum %}
            Values: 
                {% for value in parameter.items.enum %}
                <code>{{ value }}</code>
                {% endfor %}
            <br>
            {% endif %}
            {{ parameter.description }}
            </td>
            <td><code>{{ parameter.required }}</code></td>
        </tr>
        {% endif %}
    {% endfor %}
</table>
{% endif %}
{% else %}
<p>None</p>
{% endif %}