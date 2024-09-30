SELECT pz.name
FROM pizzeria AS pz
JOIN menu as m ON pz.id = m.pizzeria_id
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price < 800;