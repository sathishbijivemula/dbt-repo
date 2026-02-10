{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with src_reviews as (
    select * from {{ref('src_reviews')}}
)

select * from src_reviews
where REVIEW_TEXT is not NULL
{% if is_incremental() %}
AND REVIEW_DATE > (select max(REVIEW_DATE) from {{this}})
{% endif %}