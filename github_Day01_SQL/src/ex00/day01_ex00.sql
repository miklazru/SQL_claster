SELECT menu.id as object_id, menu.pizza_name as object_name FROM menu
UNION
SELECT person.id, person.name FROM person
ORDER BY object_id ASC, object_name ASC