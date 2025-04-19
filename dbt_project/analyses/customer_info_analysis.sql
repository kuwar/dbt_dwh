SELECT 
  *, CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("cust_info") }}