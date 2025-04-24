{{
  config(
    tags=['bronze', 'customer', 'cust', 'information', 'info', 'cust_info', 'customer_information']
  )
}}

SELECT
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date,
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("cust_info") }}
