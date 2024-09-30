
SELECT MAX(id) FROM person_visits;

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (22, 9, 3, '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM 
mv_dmitriy_visits_and_eats