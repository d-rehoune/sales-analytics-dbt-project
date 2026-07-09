SELECT
    store_id,
    product_id,
    quantity
FROM {{ source('localbike_database','stocks') }}