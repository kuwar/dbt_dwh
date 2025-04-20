{{
  config(
    tags=['bronze', 'customer', 'location', 'country', 'geography']
  )
}}

SELECT * 
  CID,
  CNTRY
FROM {{ ref("LOC_A101") }}