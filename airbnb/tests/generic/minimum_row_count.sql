{% test minimum_row_count(model, min_row_count) %}
{{config(
    severity='error'
)}}
select count(*) from {{model}} HAVING count(*) < {{min_row_count}}
{% endtest %}