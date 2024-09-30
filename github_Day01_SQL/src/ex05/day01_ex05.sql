SELECT person.id AS person_id, person.name, person.age, person.gender, person.address, pizzeria.id AS pizzeria_id, pizzeria.name, pizzeria.rating FROM pizzeria
JOIN person ON pizzeria.id = pizzeria.id
ORDER BY person_id, pizzeria_id