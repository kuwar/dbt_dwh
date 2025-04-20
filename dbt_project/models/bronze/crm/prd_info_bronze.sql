{{
  config(
    tags=['bronze', 'product', 'prd', 'information', 'info', 'prd_info', 'product_information']
  )
}}

SELECT * 
FROM {{ ref("prd_info") }}