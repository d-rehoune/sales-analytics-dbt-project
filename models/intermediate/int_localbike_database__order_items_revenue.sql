WITH
  order_items AS (
    SELECT *
    FROM {{ ref('stg_localbike_database__order_items') }}
  ),
  orders AS (
    SELECT *
    FROM {{ ref('stg_localbike_database__orders') }}
  ),
  Final AS (
    SELECT
      oi.order_id,
      oi.item_id,
      oi.order_item_id,
      oi.product_id,
      oi.quantity,
      oi.list_price,
      oi.discount,
      o.customer_id,
      o.order_status,
      o.order_date,
      o.required_date,
      o.shipped_date,
      o.store_id,
      o.staff_id,
      oi.list_price * oi.quantity AS gross_revenue,
      oi.list_price * oi.quantity * (1 - oi.discount) AS net_revenue,
      oi.list_price * oi.quantity * oi.discount AS discount_amount
    FROM order_items AS oi
    LEFT JOIN orders AS o
      ON oi.order_id = o.order_id
  )
  
SELECT * FROM Final