SELECT * 
FROM {{ source("sales_details", "sales_details") }}