SELECT DISTINCT p.name
FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
ORDER BY name ASC;
