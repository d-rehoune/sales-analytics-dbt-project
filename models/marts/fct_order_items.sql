WITH
  order_items_revenue AS (
    SELECT *
    FROM {{ ref('int_localbike_database__order_items_revenue') }}
  ),

  products_enriched AS (
    SELECT *
    FROM {{ ref('int_localbike_database__products_enriched') }}
  ),
  
  stores AS (
    SELECT *
    FROM {{ ref('stg_localbike_database__stores') }}
  ),

  Final AS (
    SELECT
      oi.order_item_id,
      oi.order_id,
      oi.order_date,
      oi.order_status,
      oi.customer_id,
      oi.staff_id,

      -- Product
      p.product_id,
      p.product_name,
      p.model_year,
      p.brand_id,
      p.brand_name,
      p.category_id,
      p.category_name,

      -- stores
      s.store_id,
      s.store_name,
      s.city AS store_city,
      s.state AS store_state,

      -- Metrics
      oi.quantity,
      oi.list_price,
      oi.discount,
      oi.gross_revenue,
      oi.net_revenue,
      oi.discount_amount
    FROM order_items_revenue AS oi
    LEFT JOIN products_enriched AS p
      ON oi.product_id = p.product_id
    LEFT JOIN stores AS s
      ON oi.store_id = s.store_id
  )

SELECT * FROM Final
