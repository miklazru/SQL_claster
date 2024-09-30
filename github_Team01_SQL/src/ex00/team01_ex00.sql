WITH first AS (SELECT currency_id, COALESCE("user".name, 'not defined') AS name, COALESCE(lastname, 'not defined') AS lastname, type, SUM(money) AS volume FROM balance
FULL JOIN (select id, name ,MAX(updated) from currency GROUP BY id, name) AS crnc  ON currency_id = crnc.id
FULL JOIN "user" ON "user".id = user_id
GROUP BY currency_id, "user".name, lastname, type
ORDER BY name DESC, lastname ASC, type ASC),
SECOND AS (SELECT first.name, lastname, type, volume, COALESCE(crnc.name, 'not defined') AS currency_name, 
COALESCE((SELECT rate_to_usd FROM currency WHERE currency.id = crnc.id AND maxupd = currency.updated), 1) AS last_rate_to_usd FROM first 
FULL JOIN (select id, name ,MAX(updated) as maxupd from currency GROUP BY id, name) AS crnc  ON currency_id = crnc.id)
SELECT *, volume * last_rate_to_usd AS total_volume_in_usd FROM SECOND
