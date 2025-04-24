{{
  config(
    tags=['bronze', 'customer', 'dateofbirth', 'birth', 'gender']
  )
}}

SELECT
    "CID",
    "BDATE",
    "GEN",
    CURRENT_TIMESTAMP AS _ingestion_timestamp
FROM {{ ref("CUST_AZ12") }}
