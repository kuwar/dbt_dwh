{{
  config(
    tags=['bronze', 'product', 'prd', 'information', 'info', 'prd_info', 'product_information']
  )
}}

SELECT
    prd_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt,
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("prd_info") }}
