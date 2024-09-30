CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci_number INTEGER)
LANGUAGE plpgsql
AS $$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    temp INTEGER;
BEGIN
    RETURN QUERY SELECT a AS fibonacci_number;
    RETURN QUERY SELECT b AS fibonacci_number;

    WHILE b < pstop LOOP
        temp := a + b;
        a := b;
        b := temp;

        IF b < pstop THEN
            RETURN QUERY SELECT b AS fibonacci_number;
        END IF;
    END LOOP;
END;
$$;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
