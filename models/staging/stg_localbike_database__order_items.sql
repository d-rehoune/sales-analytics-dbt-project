SELECT 
  order_id, 
  item_id, 
  product_id, 
  quantity, 
  list_price, 
  discount
FROM {{ source('localbike_database', 'order_items') }}