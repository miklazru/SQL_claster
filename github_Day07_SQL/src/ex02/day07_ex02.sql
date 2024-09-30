WITH order_counts AS (
    SELECT 
        pz.name,
        COUNT(po.id) AS count,
        'order' AS action_type,
        ROW_NUMBER() OVER (ORDER BY COUNT(po.id) DESC) AS rank
    FROM pizzeria AS pz
    JOIN menu AS m ON pz.id = m.pizzeria_id
    JOIN person_order AS po ON m.id = po.menu_id
    GROUP BY pz.name
),
visit_counts AS (
    SELECT 
        pz.name,
        COUNT(pv.id) AS count,
        'visit' AS action_type,
        ROW_NUMBER() OVER (ORDER BY COUNT(pv.id) DESC) AS rank
    FROM pizzeria AS pz
    JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
    GROUP BY pz.name
),
combined_counts AS (
    SELECT name, count, action_type FROM order_counts WHERE rank <= 3
    UNION ALL
    SELECT name, count, action_type FROM visit_counts WHERE rank <= 3
)
SELECT * 
FROM combined_counts
ORDER BY action_type ASC, count DESC;