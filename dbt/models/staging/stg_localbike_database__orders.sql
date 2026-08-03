SELECT
  order_id,
  customer_id,
  order_status,
  order_date,
  required_date,
  SAFE_CAST(NULLIF(shipped_date, 'NULL') AS DATE) AS shipped_date,
  store_id,
  staff_id
FROM {{ source('localbike_database', 'orders') }}