--1ая сессия

BEGIN;

UPDATE pizzeria SET rating = rating + 1 WHERE id = 1;

SELECT pg_sleep(10);

UPDATE pizzeria SET rating = rating + 1 WHERE id = 2;

COMMIT;

--2ая сессия

BEGIN;

UPDATE pizzeria SET rating = rating + 1 WHERE id = 2;

SELECT pg_sleep(10);

UPDATE pizzeria SET rating = rating + 1 WHERE id = 1;

COMMIT;