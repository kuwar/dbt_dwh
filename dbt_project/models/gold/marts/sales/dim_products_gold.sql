SELECT
    -- Surrogate key
    pn.prd_id AS product_id,
    pn.prd_key AS product_number,
    pn.prd_nm AS product_name,
    pn.cat_id AS category_id,
    pc.cat AS category,
    pc.subcat AS subcategory,
    pc.maintenance,
    pn.prd_cost AS cost,
    pn.prd_line AS product_line,
    pn.prd_start_dt AS start_date,
    ROW_NUMBER() OVER (
        ORDER BY pn.prd_start_dt, pn.prd_key
    ) AS product_key
FROM {{ ref('product_information_silver') }} AS pn
LEFT JOIN {{ ref('product_categories_silver') }} AS pc
    ON pn.cat_id = pc.id
WHERE pn.prd_end_dt IS NULL -- Filter out all historical data
