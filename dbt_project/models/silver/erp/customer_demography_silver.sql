{{
  config(
    tags=['silver', 'demography', 'customer', 'dateofbirth', 'birth', 'gender']
  )
}}

SELECT
    CASE
        -- Remove 'NAS' prefix if present
        WHEN "CID" LIKE 'NAS%' THEN SUBSTRING("CID", 4, LENGTH("CID"))
        ELSE "CID"
    END AS cid,
    CASE
        WHEN "BDATE" > CURRENT_DATE THEN NULL
        ELSE "BDATE"
    END AS bdate, -- Set future birthdates to NULL
    CASE
        WHEN UPPER(TRIM("GEN")) IN ('F', 'FEMALE') THEN 'Female'
        WHEN UPPER(TRIM("GEN")) IN ('M', 'MALE') THEN 'Male'
        ELSE 'n/a'
    END AS gen, -- Normalize gender values and handle unknown cases
    CURRENT_TIMESTAMP AS dwh_create_date
FROM {{ ref("CUST_AZ12_bronze") }}
