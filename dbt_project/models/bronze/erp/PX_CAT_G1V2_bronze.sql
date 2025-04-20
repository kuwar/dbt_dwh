{{
  config(
    tags=['bronze', 'product', 'category', 'subcategory', 'maintenance']
  )
}}

SELECT 
  ID,
  CAT,
  SUBCAT,
  MAINTENANCE
FROM {{ ref("PX_CAT_G1V2") }}