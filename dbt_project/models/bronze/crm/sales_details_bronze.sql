{{
  config(
    tags=['bronze', 'sales', 'details', 'sales_details']
  )
}}

SELECT * 
FROM {{ ref("sales_details") }}