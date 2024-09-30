SELECT (SELECT name FROM person WHERE person.id = person_id), COUNT(visit_date) AS count_of_visits FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC, person_id ASC
LIMIT 4