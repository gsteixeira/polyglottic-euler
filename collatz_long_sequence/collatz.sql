-- Find the longest Collatz Sequence in all the numbers starting at..
-- NOTE: we will use a table to cache sequences we already have walked through

CREATE TABLE IF NOT EXISTS cached_collatz (
    root_number INTEGER UNIQUE NOT NULL,
    sequence_length INTEGER NOT NULL );
CREATE INDEX IF NOT EXISTS idx_collatz ON cached_collatz (root_number);

CREATE OR REPLACE FUNCTION collatz_recursive(numb integer) 
        RETURNS integer AS $$
    DECLARE
        counter integer;
    BEGIN
        SELECT sequence_length INTO counter 
            FROM cached_collatz WHERE root_number = numb;
        -- check if we haven't already calculated this, If yes, return right away.
        IF counter IS NOT NULL THEN
            RETURN counter;
        END IF;
        -- Now do the calculations
        IF numb = 1 THEN
            counter := 1;
        ELSIF MOD(numb, 2) = 0 THEN
            counter := 1 + collatz_recursive(numb / 2);
        ELSE
            counter := 1 + collatz_recursive(3 * numb +1);
        END IF;
        -- finally store the answer on the table, so we have it next time.
        INSERT INTO cached_collatz
            (root_number, sequence_length) VALUES (numb, counter);
        
        RETURN COUNTER;
END
$$ LANGUAGE plpgsql;


DO $$
    DECLARE
        i integer;
        larger_id integer;
        larger_seq integer;
        seq_count integer;
    BEGIN
        larger_seq := 0;
        FOR i in 2 .. 10000 LOOP
            seq_count := collatz_recursive(i);
            IF seq_count > larger_seq THEN
                larger_id := i;
                larger_seq := seq_count;
            END IF;
        END LOOP;
        RAISE INFO 'Longest collatz sequence has % elements for %',
                    larger_seq, larger_id ;
END; 
$$;

DROP TABLE IF EXISTS cached_collatz;
DROP FUNCTION IF EXISTS collatz_recursive(integer);
