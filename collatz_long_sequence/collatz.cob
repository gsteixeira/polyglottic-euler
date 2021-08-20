    IDENTIFICATION DIVISION.
        PROGRAM-ID. Main.
        DATE-WRITTEN. 2021-08-19.
        AUTHOR. Gustavo S. Teixeira.
        *> Find the largest Collatz sequence up to a given number
        DATA DIVISION.
            WORKING-STORAGE SECTION.
            01 collatz_calculations.
                02 numb             PIC 9(12) VALUE ZEROS.
                02 counter          PIC 9(12) VALUE ZEROS.
            01 find_out_longest.
                02 longest_id       PIC 9(12) VALUE ZEROS.
                02 longest_count    PIC 9(12) VALUE ZEROS.
        PROCEDURE DIVISION.
            MOVE 0 TO longest_count.
            PERFORM VARYING numb FROM 10000 BY -1 UNTIL numb < 1
                *> DISPLAY i
                CALL 'collatz_counter' USING numb GIVING counter
                IF counter > longest_count THEN
                    MOVE counter TO longest_count
                    MOVE numb TO longest_id
                END-IF
            END-PERFORM.
            DISPLAY "The longest collatz sequence has " longest_count
                    " elements for " longest_id
                    END-DISPLAY.
        GOBACK RETURNING 0.
    END PROGRAM Main.

    IDENTIFICATION DIVISION.
        PROGRAM-ID. collatz_counter IS RECURSIVE.
        *> count terms in the collatz sequence
        DATA DIVISION.
            WORKING-STORAGE SECTION.
            01 variables.
                02 counter           PIC 9(12) VALUE ZEROS.
                02 n_number          PIC 9(12) VALUE ZEROS.
                02 next_number       PIC 9(12) VALUE ZEROS.
                02 next_collatz      PIC 9(12) VALUE ZEROS.
            LINKAGE SECTION.
                01 arg_number        PIC 9(12).
        PROCEDURE DIVISION USING arg_number.
            MOVE arg_number TO n_number.
            *> DISPLAY "collatz Number: " n_number. 
            IF n_number = 1 THEN
                MOVE 1 TO counter
            ELSE
                IF FUNCTION REM(n_number, 2) = 0 THEN
                    DIVIDE n_number BY 2 GIVING next_number
                    CALL 'collatz_counter' USING next_number GIVING counter
                    ADD 1 TO counter
                ELSE
                    COMPUTE next_number = 3 * n_number + 1
                    CALL 'collatz_counter' USING next_number GIVING counter
                    ADD 1 TO counter
                END-IF
            END-IF.
            GOBACK RETURNING counter.
    END PROGRAM collatz_counter.
