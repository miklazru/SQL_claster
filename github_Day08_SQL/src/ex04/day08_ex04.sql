--работаем с 1-ой сессии

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 

BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--работаем с 2-ой сессии, прерываем с 1-ой сессии

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--продолжаем с 1-ой сессии

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

COMMIT;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';