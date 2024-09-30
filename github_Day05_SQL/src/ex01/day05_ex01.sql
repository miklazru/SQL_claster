--Проверка содержимого 
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id;

EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id;
--там seq анализ не работает
--добавляем для большего числа памяти

-- Добавим больше данных в таблицы menu и pizzeria
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT id + 100, pizzeria_id, pizza_name  '_extra', price
FROM menu;

INSERT INTO pizzeria (id, name, rating)
SELECT id + 10, name  '_extra', rating
FROM pizzeria;

--обновляем
ANALYZE menu;
ANALYZE pizzeria;

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id;

SET enable_seqscan = ON;
--отключаем секу скан и делаем запрос

DELETE FROM menu WHERE id > 100;
DELETE FROM pizzeria WHERE id > 10;

--возвращаем как было