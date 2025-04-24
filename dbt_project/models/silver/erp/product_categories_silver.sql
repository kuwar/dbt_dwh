{{
  config(
    tags=['silver', 'product', 'category', 'subcategory', 'maintenance']
  )
}}

SELECT
    "ID" AS id,
    "CAT" AS cat,
    "SUBCAT" AS subcat,
    "MAINTENANCE" AS maintenance,
    CURRENT_TIMESTAMP AS dwh_create_date
FROM {{ ref("PX_CAT_G1V2_bronze") }}
