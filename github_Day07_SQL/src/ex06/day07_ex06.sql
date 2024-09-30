SELECT 
    pz.name, 
    COUNT(po.id),
    ROUND(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM pizzeria AS pz
JOIN menu AS m ON pz.id = m.pizzeria_id
JOIN person_order AS po ON m.id = po.menu_id
GROUP BY pz.name 
ORDER BY pz.name ASC;
