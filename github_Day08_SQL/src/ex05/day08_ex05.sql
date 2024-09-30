--работаем с 1-ой сессии

SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

BEGIN;

SELECT SUM(rating) FROM pizzeria;

--работаем с 2-ой сессии, прерываем с 1-ой сессии

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

INSERT INTO pizzeria VALUES (id, name, rating)
VALUES (10, 'Kazan Pizza', 5);

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Kazan Pizza';

--продолжаем с 1-ой сессии

COMMIT;

SELECT SUM(rating) FROM pizzeria;