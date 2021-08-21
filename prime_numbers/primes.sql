-- generates a list of prime numbers
CREATE OR REPLACE FUNCTION is_prime(numb integer)
    RETURNS boolean AS $$
    BEGIN
        FOR i IN 2 .. numb-1 LOOP
            IF MOD(numb, i) = 0 THEN
                RETURN false;
            END IF;
        END LOOP;
        RETURN true;
END;
$$ LANGUAGE plpgsql;


DO $$
DECLARE
    i integer;
    BEGIN
        FOR i IN 1 .. 999 LOOP
            IF is_prime(i) THEN
                RAISE INFO '%', i;
            END IF;
        END LOOP;
END; $$;

DROP FUNCTION is_prime(integer);
