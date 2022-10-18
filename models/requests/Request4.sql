WITH behavior_probability 
AS (
    SELECT TO_CHAR((date_witness),'MMMM')as month,
    ROUND(CAST(SUM(CASE WHEN behavior IN (SELECT behavior from {{ ref('Request3') }}) THEN 1 ELSE 0 END) AS NUMERIC) / CAST(COUNT(date_witness) AS NUMERIC), 2) 
    AS probability
    FROM {{ ref('witness') }}
    GROUP BY month
)

SELECT month,
       probability
FROM behavior_probability
ORDER BY month