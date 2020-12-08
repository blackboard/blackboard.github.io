<!-- Determine if there are any responses listed in the Swagger file -->
{% assign hasparams = false %}
{% for response in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]responses %}
    {% assign hasparams = true %}
{% endfor %}

{% if hasparams == true %}
<table>
    <thead>
    <tr><th>Code</th><th>Returns</th></tr>
    </thead>
    <!-- For each response, get the code from the Swagger file -->
    {% for response in site.data.swagger[page.swaggerfile]paths[page.swaggerkey][page.method]responses %}
        <tr>
            <!-- response[0] is the response code -->
            <td>{{ response[0] }}</td>
            <td>
            {{ response[1].description }}
            </td>
        </tr>
    {% endfor %}
</table>
{% else %}
<p>None</p>
{% endif %}