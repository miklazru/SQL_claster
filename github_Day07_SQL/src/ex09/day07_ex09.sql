WITH age_stats AS (
    SELECT 
        p.address,
        MAX(p.age) AS max_age,
        MIN(p.age) AS min_age,
        AVG(p.age) AS avg_age
    FROM person AS p
    GROUP BY p.address
),
address_comparison AS (
    SELECT 
        address,
        ROUND((MAX(age_stats.max_age) - (MIN(age_stats.min_age)::numeric / MAX(age_stats.max_age))), 2) AS formula,
        ROUND(age_stats.avg_age, 2) AS average,
        CASE 
            WHEN (MAX(age_stats.max_age) - (MIN(age_stats.min_age) / MAX(age_stats.max_age))) > age_stats.avg_age THEN 'true'
            ELSE 'false'
        END AS comparison
    FROM age_stats
    GROUP BY address, age_stats.avg_age
)
SELECT address, formula, average, comparison
FROM address_comparison
ORDER BY address;
