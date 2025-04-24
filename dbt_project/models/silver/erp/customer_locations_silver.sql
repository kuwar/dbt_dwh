{{
  config(
    tags=['silver', 'customer', 'location', 'country', 'geography']
  )
}}

SELECT
    REPLACE("CID", '-', '') AS cid,
    CASE
        WHEN TRIM("CNTRY") = 'DE' THEN 'Germany'
        WHEN TRIM("CNTRY") IN ('US', 'USA') THEN 'United States'
        WHEN TRIM("CNTRY") = '' OR "CNTRY" IS NULL THEN 'n/a'
        ELSE TRIM("CNTRY")
    END AS cntry, -- Normalize and Handle missing or blank country codes
    CURRENT_TIMESTAMP AS dwh_create_date
FROM {{ ref("LOC_A101_bronze") }}
