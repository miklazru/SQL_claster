CREATE OR REPLACE FUNCTION func_minimum(arr FLOAT8[])
RETURNS FLOAT8
LANGUAGE plpgsql
AS $$
DECLARE
    min_val FLOAT8;
    element FLOAT8;
BEGIN
    min_val := arr[1];

    FOREACH element IN ARRAY arr
    LOOP
        IF element < min_val THEN
            min_val := element;
        END IF;
    END LOOP;

    RETURN min_val;
END;
$$;

SELECT func_minimum(ARRAY[10.0, -1.0, 5.0, 4.4]);
