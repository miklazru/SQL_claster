SELECT DISTINCT pz.name AS pizzeria_name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.gender = 'female' 
  AND pz.id NOT IN (
  SELECT pz.id
  FROM pizzeria AS pz
  JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
  JOIN person AS p ON p.id = pv.person_id 
  WHERE p.gender = 'male'
  )

UNION

SELECT DISTINCT pz.name AS pizzeria_name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.gender = 'male'
  AND pz.id NOT IN (
  SELECT pz.id
  FROM pizzeria AS pz
  JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
  JOIN person AS p ON p.id = pv.person_id
  WHERE p.gender = 'female'
  )

ORDER BY pizzeria_name ASC;