SELECT
    brand_id,
    brand_name
FROM {{ source('localbike_database', 'brands') }}