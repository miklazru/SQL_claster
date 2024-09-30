CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, CAST (m.price * 0.9 AS INTEGER) AS discount_price
FROM person AS p
  JOIN person_order AS po ON p.id = po.person_id
  JOIN menu AS m ON m.id = po.menu_id
ORDER BY p.name, m.pizza_name, m.price, discount_price