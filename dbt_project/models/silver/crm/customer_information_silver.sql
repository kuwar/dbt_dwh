{{
  config(
    tags=['silver', 'customer', 'cust', 'information', 'info', 'cust_info', 'customer_information']
  )
}}

WITH customers AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY cst_id
            ORDER BY cst_create_date DESC
        ) AS latest_record  -- ordered the customer records
    FROM {{ ref("cust_info_bronze") }}
    WHERE cst_id IS NOT NULL
),

distinct_customers AS (
    SELECT
        cst_id,
        cst_key,
        TRIM(cst_firstname) AS cst_firstname,
        TRIM(cst_lastname) AS cst_lastname,
        CASE
            WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
            WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
            ELSE 'n/a'
        END AS cst_marital_status, -- Normalize marital status values to readable format
        CASE
            WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
            WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
            ELSE 'n/a'
        END AS cst_gndr, -- Normalize gender values to readable format
        TO_DATE(cst_create_date, 'DD/MM/YYYY') AS cst_create_date,
        CURRENT_TIMESTAMP AS dwh_create_date
    FROM customers
    WHERE latest_record = 1 -- Select the most recent record per customer
)

SELECT * FROM distinct_customers
