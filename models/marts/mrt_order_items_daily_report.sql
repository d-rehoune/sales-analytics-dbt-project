WITH
  order_items_revenue AS (
    SELECT *
    FROM {{ ref('int_localbike_database__order_items_revenue') }}
  ),

  final AS (
    SELECT
      order_date,
      SUM(gross_revenue) AS total_gross_revenue,
      SUM(net_revenue) AS total_net_revenue,
      SUM(discount_amount) AS total_discount_amount,
      SUM(quantity) AS total_units_sold,
      COUNT(DISTINCT order_id) AS total_orders,
      SAFE_DIVIDE(SUM(net_revenue), COUNT(DISTINCT order_id)) AS average_order_value
    FROM order_items_revenue
    GROUP BY order_date
  )

SELECT * FROM final