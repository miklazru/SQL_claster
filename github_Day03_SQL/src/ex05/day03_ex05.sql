SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.name = 'Andrey' AND NOT EXISTS (
  SELECT 1
  FROM person_order AS po
  JOIN menu AS m ON m.id = po.menu_id
  WHERE po.person_id = p.id AND m.pizzeria_id = pz.id
)
ORDER BY pizzeria_name ASC;