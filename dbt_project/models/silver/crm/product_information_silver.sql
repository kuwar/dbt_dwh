{{
  config(
    tags=['silver', 'product', 'prd', 'information', 'info', 'prd_info', 'product_information']
  )
}}

/***
  In the prd_start_dt and prd_end_dt there is anamolies.
  Sometimes prd_end_dt < prd_start_dt - which is imposible

  So Here end date is created only if the product has subsiquent
  release and set it as a dat before the start of that product.

  Also prd_key contains product category id - first 5 character
  and prd_key as characters from 7th to all the character of prd_key
*/

SELECT
  prd_id,
  REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id, -- Extract category ID
  SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,        -- Extract product key
  prd_nm,
  NULLIF(prd_cost, 0) AS prd_cost,
  CASE 
    WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
    WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
    WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
    WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
    ELSE 'n/a'
  END AS prd_line, -- Map product line codes to descriptive values
  CAST(prd_start_dt AS DATE) AS prd_start_dt,
  CAST(
    LEAD(TO_DATE(prd_start_dt, 'DD/MM/YYYY')) OVER (
      PARTITION BY prd_key 
      ORDER BY TO_DATE(prd_start_dt, 'DD/MM/YYYY')
    ) - INTERVAL '1 day' 
    AS DATE
  ) AS prd_end_dt, -- Calculate end date as one day before the next start date
  CURRENT_TIMESTAMP As dwh_create_date
FROM {{ ref("prd_info_bronze") }}
