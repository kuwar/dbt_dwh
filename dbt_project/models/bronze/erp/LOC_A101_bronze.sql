{{
  config(
    tags=['bronze', 'customer', 'location', 'country', 'geography']
  )
}}

SELECT
    "CID",
    "CNTRY",
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("LOC_A101") }}
