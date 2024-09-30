SELECT 
  m.pizza_name, 
  m.price, 
  pz.name AS pizzeria_name, 
  pv.visit_date
FROM menu AS m
JOIN person_order AS po ON po.menu_id = m.id
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = po.person_id
WHERE 
  p.name = 'Kate' AND
  m.price BETWEEN 800 AND 1000
ORDER BY 
  pizza_name ASC, 
  price ASC,
  pizzeria_name ASC;