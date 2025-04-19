SELECT * 
FROM {{ source("customer_info", "cust_info") }}