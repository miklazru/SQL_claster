CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice INTEGER DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (pizzeria_name VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT p.name
    FROM pizzeria p
    JOIN person_visits v ON p.id = v.pizzeria_id
    JOIN person pe ON v.person_id = pe.id
    JOIN menu m ON p.id = m.pizzeria_id
    WHERE pe.name = pperson
      AND m.price < pprice
      AND v.visit_date = pdate;
END;
$$;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
