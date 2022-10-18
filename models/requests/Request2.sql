WITH carry_prob 
AS (
    SELECT TO_CHAR((date_witness),'MMMM')as month,
    ROUND(CAST(SUM(CASE WHEN has_weapon AND has_jacket AND NOT has_hat THEN 1 ELSE 0 END) AS NUMERIC) / CAST(COUNT(date_witness) AS NUMERIC), 2)
    AS probability
    FROM {{ ref('witness') }}
    GROUP BY month
)

SELECT month,
       probability
FROM carry_prob
ORDER BY month