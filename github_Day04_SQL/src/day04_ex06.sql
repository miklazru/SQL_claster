CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name
FROM pizzeria AS pz
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
JOIN menu AS m ON pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND m.price < 800 AND visit_date = '2022-01-08'