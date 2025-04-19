{{
  config(
    tags=['bronze', 'customer', 'cust', 'information', 'info', 'cust_info', 'customer_information']
  )
}}

SELECT 
  *, CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("cust_info") }}