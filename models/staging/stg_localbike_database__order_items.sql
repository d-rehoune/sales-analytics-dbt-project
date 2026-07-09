SELECT 
  order_id, 
  item_id, 
  product_id, 
  quantity, 
  SAFE_CAST(list_price AS NUMERIC) AS list_price, 
  SAFE_CAST(discount AS NUMERIC) AS discount
FROM {{ source('localbike_database', 'order_items') }}