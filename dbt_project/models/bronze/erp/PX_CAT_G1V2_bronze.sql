{{
  config(
    tags=['bronze', 'product', 'category', 'subcategory', 'maintenance']
  )
}}

SELECT
    "ID",
    "CAT",
    "SUBCAT",
    "MAINTENANCE",
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("PX_CAT_G1V2") }}
