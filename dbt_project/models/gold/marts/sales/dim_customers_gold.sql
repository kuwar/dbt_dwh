SELECT
    ci.cst_id AS customer_id, -- Surrogate key
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    ci.cst_marital_status AS marital_status,
    ca.bdate AS birthdate,
    ci.cst_create_date AS create_date,
    ROW_NUMBER() OVER (
        ORDER BY cst_id
    ) AS customer_key,
    CASE
        -- CRM is the primary source for gender
        WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
        ELSE COALESCE(ca.gen, 'n/a') -- Fallback to ERP data
    END AS gender
FROM {{ ref('customer_information_silver') }} AS ci
LEFT JOIN {{ ref('customer_demography_silver') }} AS ca
    ON ci.cst_key = ca.cid
LEFT JOIN {{ ref('customer_locations_silver') }} AS la
    ON ci.cst_key = la.cid
