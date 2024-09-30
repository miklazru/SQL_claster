WITH order_counts AS (
    SELECT 
        pz.name,
        COUNT(po.id) AS order_count
    FROM pizzeria AS pz
    JOIN menu AS m ON pz.id = m.pizzeria_id
    JOIN person_order AS po ON m.id = po.menu_id
    GROUP BY pz.name
),
visit_counts AS (
    SELECT 
        pz.name,
        COUNT(pv.id) AS visit_count
    FROM pizzeria AS pz
    JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
    GROUP BY pz.name
),
combined_counts AS (
    SELECT 
        name,
        COALESCE(order_count, 0) + COALESCE(visit_count, 0) AS total_count
    FROM (
        SELECT 
            name,
            SUM(order_count) AS order_count,
            SUM(visit_count) AS visit_count
        FROM (
            SELECT 
                pz.name,
                COUNT(po.id) AS order_count,
                0 AS visit_count
            FROM pizzeria AS pz
            LEFT JOIN menu AS m ON pz.id = m.pizzeria_id
            LEFT JOIN person_order AS po ON m.id = po.menu_id
            GROUP BY pz.name
            UNION ALL
            SELECT 
                pz.name,
                0 AS order_count,
                COUNT(pv.id) AS visit_count
            FROM pizzeria AS pz
            LEFT JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
            GROUP BY pz.name
        ) AS subquery
        GROUP BY name
    ) AS counts
)
SELECT 
    name,
    total_count
FROM combined_counts
ORDER BY total_count DESC, name ASC;
