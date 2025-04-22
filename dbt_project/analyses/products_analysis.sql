select * FROM
(
    SELECT 
        row_number() over(partition by prd_id order by prd_start_dt) as prd_rank,
        prd_id,
        prd_key,
        prd_nm,
        prd_cost,
        prd_line,
        prd_start_dt,
        prd_end_dt
    FROM {{ ref("prd_info") }}
)
where prd_start_dt > prd_end_dt