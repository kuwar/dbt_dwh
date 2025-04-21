SELECT 
  cst_id,
  cst_key,
  cst_firstname,
  cst_lastname,
  cst_marital_status,
  cst_gndr,
  cst_create_date, 
  _ingestion_timestamp
FROM {{ ref("cust_info_bronze") }}