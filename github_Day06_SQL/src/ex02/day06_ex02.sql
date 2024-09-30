SELECT 
	p.name, 
	m.pizza_name, 
	m.price, 
	TRUNC (m.price - (m.price * pd.discount / 100), 0) AS discount_price,
	pz.name
FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
JOIN person_discounts AS pd ON pz.id = pd.pizzeria_id
ORDER BY p.name, m.pizza_name;
