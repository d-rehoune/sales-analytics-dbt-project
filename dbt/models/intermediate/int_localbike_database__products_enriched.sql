WITH
  products AS (
    SELECT *
    FROM {{ ref(('stg_localbike_database__products')) }}
  ),
  categories AS (
    SELECT *
    FROM {{ ref('stg_localbike_database__categories') }}
  ),
  brands AS (
    SELECT *
    FROM {{ ref('stg_localbike_database__brands') }}
  ),
  Final AS (
    SELECT
      p.product_id,
      p.product_name,
      p.brand_id,
      p.category_id,
      p.model_year,
      p.list_price,
      c.category_name,
      b.brand_name
    FROM products AS p
    LEFT JOIN categories AS c
      ON p.category_id = c.category_id
    LEFT JOIN brands AS b
      ON p.brand_id = b.brand_id
  )

SELECT * FROM Final
