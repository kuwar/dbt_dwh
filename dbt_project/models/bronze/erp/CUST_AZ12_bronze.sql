{{
  config(
    tags=['bronze', 'customer', 'dateofbirth', 'birth', 'gender']
  )
}}

SELECT
    "CID",
    "BDATE",
    "GEN"
FROM {{ ref("CUST_AZ12") }}
