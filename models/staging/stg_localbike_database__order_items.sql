SELECT 
  order_id, 
  item_id, 
  CONCAT(SAFE_CAST(order_id AS STRING), '_', SAFE_CAST(item_id AS STRING)) AS order_item_id,
  product_id, 
  quantity, 
  SAFE_CAST(list_price AS NUMERIC) AS list_price, 
  SAFE_CAST(discount AS NUMERIC) AS discount
FROM {{ source('localbike_database', 'order_items') }}