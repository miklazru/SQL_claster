insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH first AS (SELECT crnc.id, crnc.name AS currency_name, balance.user_id, balance.money, balance.updated,	
(SELECT rate_to_usd FROM currency
WHERE currency.id = balance.currency_id AND currency.updated < balance.updated
ORDER BY currency.updated DESC
LIMIT 1) AS rate1,	
(SELECT rate_to_usd FROM currency
WHERE currency.id = balance.currency_id AND currency.updated > balance.updated
ORDER BY currency.updated ASC
LIMIT 1) AS rate2
FROM balance
JOIN(SELECT currency.id, currency.name FROM currency GROUP BY currency.id, currency.name) AS crnc ON crnc.id = balance.currency_id),
	second AS (
SELECT id, currency_name, user_id, money, updated,
      	CASE
           WHEN rate1 IS NOT NULL THEN rate1
           WHEN rate2 IS NOT NULL THEN rate2
           ELSE 1
       END AS rate
FROM first)

SELECT COALESCE((SELECT name FROM "user" WHERE user_id = "user".id), 'not defined') AS name,
		COALESCE((SELECT lastname FROM "user" WHERE user_id = "user".id), 'not defined') AS lastname,
		currency_name, rate * money	AS currency_in_usd	FROM second
ORDER BY name DESC, lastname ASC, currency_name ASC





