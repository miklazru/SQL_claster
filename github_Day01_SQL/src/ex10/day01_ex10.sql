SELECT person.name as person_name, menu.pizza_name, pizzeria.name as pizzeria_name FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN person_visits ON (person_order.order_date = person_visits.visit_date AND person.id = person_visits.person_id)
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
ORDER BY person_name ASC, menu.pizza_name ASC, pizzeria_name ASC