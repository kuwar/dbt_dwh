{{
  config(
    tags=['bronze', 'sales', 'details', 'sales_details']
  )
}}

SELECT
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price,
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("sales_details") }}
