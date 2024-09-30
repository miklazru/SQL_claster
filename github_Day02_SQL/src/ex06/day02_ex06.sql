SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
JOIN person_order AS po ON m.id = po.menu_id
JOIN person AS p ON po.person_id = p.id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY m.pizza_name, pz.name;