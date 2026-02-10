SELECT l.listing_id FROM {{ ref('dim_listing_cleansed') }} l
INNER JOIN {{ ref('fct_reviews') }} r
on r.listing_id = l.listing_id
WHERE l.created_at > r.review_date