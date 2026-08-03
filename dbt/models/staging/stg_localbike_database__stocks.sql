SELECT
    CONCAT(SAFE_CAST(store_id AS STRING), '_', SAFE_CAST(product_id AS STRING)) AS stocks_id,
    store_id,
    product_id,
    quantity
FROM {{ source('localbike_database','stocks') }}