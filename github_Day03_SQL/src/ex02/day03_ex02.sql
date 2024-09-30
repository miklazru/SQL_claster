SELECT 
  m.pizza_name,
  m.price,
  pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
WHERE NOT EXISTS (
  SELECT 1
  FROM person_order AS po
  WHERE m.id = po.menu_id
)
ORDER BY m.pizza_name ASC, m.price ASC;