{{
  config(
    tags=['bronze', 'customer', 'dateofbirth', 'birth', 'gender']
  )
}}

SELECT * 
FROM {{ ref("CUST_AZ12") }}