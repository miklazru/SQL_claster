SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.gender = 'female'

UNION ALL

SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.gender = 'male'

ORDER BY pizzeria_name ASC;