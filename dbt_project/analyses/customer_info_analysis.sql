SELECT 
  "CID",
  "BDATE",
  "GEN"
FROM {{ ref("CUST_AZ12") }}