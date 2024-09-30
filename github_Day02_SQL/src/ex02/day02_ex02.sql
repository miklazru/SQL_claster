SELECT 
  COALESCE(p.name, '-') AS person_name,
  pv.visit_date AS visit_date,
  COALESCE(pz.name, '-') AS pizzeria_name
FROM person AS p
FULL OUTER JOIN person_visits AS pv ON p.id = pv.person_id
FULL OUTER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC;