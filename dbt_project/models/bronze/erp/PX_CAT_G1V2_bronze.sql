{{
  config(
    tags=['bronze', 'product', 'category', 'subcategory', 'maintenance']
  )
}}

SELECT * 
FROM {{ ref("PX_CAT_G1V2") }}