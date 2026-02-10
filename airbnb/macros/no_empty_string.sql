{% macro no_empty_string(model) %}

{% for col in adapter.get_columns_inrelation(model) %}
    {% if col.is_string() %}
        {{col.name }} is not NULL AND {{col.name }} <> '' AND
    {% endif %}
    TRUE
{% endfor %}

{% endmacro %}