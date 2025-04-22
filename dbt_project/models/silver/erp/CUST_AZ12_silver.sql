{{
  config(
    tags=['silver', 'demography', 'customer', 'dateofbirth', 'birth', 'gender']
  )
}}

SELECT
	CASE
		WHEN "CID" LIKE 'NAS%' THEN SUBSTRING("CID", 4, LENGTH("CID")) -- Remove 'NAS' prefix if present
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
	CURRENT_TIMESTAMP as dwh_create_date
FROM {{ ref("CUST_AZ12_bronze") }}
