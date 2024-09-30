INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT
  (SELECT MAX(id) FROM person_visits) + ROW_NUMBER() OVER (ORDER BY p.id) AS new_id, 
  p.id AS person_id,
  (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id,
  '2022-02-25' AS visit_date
FROM person AS p;