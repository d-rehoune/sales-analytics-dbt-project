SELECT 
  product_id, 
  product_name, 
  brand_id, 
  category_id, 
  model_year, 
  SAFE_CAST(list_price AS NUMERIC) AS list_price
FROM {{ source('localbike_database', 'products') }}