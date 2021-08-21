-- Generates a fibonacci sequence
DO $$
DECLARE
    i integer;
    a integer;
    b integer;
    nth integer;
BEGIN 
    a := 0;
    b := 1;
    FOR i IN 1 .. 40 LOOP
        RAISE INFO '%', a;
        nth := a + b;
        a := b;
        b := nth;
    END LOOP;
END; $$;
