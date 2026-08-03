SELECT
  staff_id, 
  store_id, 
  SAFE_CAST(NULLIF(manager_id, 'NULL') AS INT64) AS manager_id,
  first_name, 
  last_name, 
  email, 
  phone, 
  active
FROM {{ source('localbike_database','staffs') }}