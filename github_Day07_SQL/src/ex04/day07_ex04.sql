SELECT p.name, COUNT(pv.visit_date) AS count_of_visits
FROM person_visits AS pv
JOIN person AS p ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(pv.visit_date) > 3
ORDER BY count_of_visits DESC, p.name ASC;