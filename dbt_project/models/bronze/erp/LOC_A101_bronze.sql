{{
  config(
    tags=['bronze', 'customer', 'location', 'country', 'geography']
  )
}}

SELECT * 
FROM {{ ref("LOC_A101") }}