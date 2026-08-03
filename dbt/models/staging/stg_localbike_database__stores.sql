SELECT 
  store_id, 
  store_name, 
  phone, 
  email, 
  street, 
  city, 
  state, 
  SAFE_CAST(zip_code AS STRING) AS zip_code
FROM {{ source('localbike_database', 'stores') }}
