SELECT m.id AS menu_id
FROM menu AS m
WHERE NOT EXISTS (
  SELECT 1
  FROM person_order AS po
  WHERE m.id = po.menu_id
)
ORDER BY menu_id ASC;