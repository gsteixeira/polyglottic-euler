        *> Bubble sort in Cobol
        IDENTIFICATION DIVISION.
            PROGRAM-ID. Main.
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                01 n_terms CONSTANT as 10.
                01 i USAGE IS INDEX.
                01 datetime         PIC X(21).
                01 seed             PIC S9(9) BINARY.
                01 the_array.
                    02 rows OCCURS n_terms TIMES.
                        03 array PIC 99 VALUE ZERO.
            PROCEDURE DIVISION.
                PERFORM seed_random.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > n_terms
                    COMPUTE array(i) = FUNCTION RANDOM * 99
                    DISPLAY array(i) ", " WITH NO ADVANCING
                END-PERFORM.
                CALL 'bubble_sort' USING the_array.
                DISPLAY SPACE.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > n_terms
                    DISPLAY array(i) ", " WITH NO ADVANCING
                END-PERFORM.
                DISPLAY SPACE.
            STOP RUN.
            seed_random.
                MOVE FUNCTION CURRENT-DATE TO datetime
                MOVE datetime(8:9) TO seed
                COMPUTE i = FUNCTION RANDOM (seed)
                EXIT.
        END PROGRAM Main.

        IDENTIFICATION DIVISION.
            PROGRAM-ID. bubble_sort.
            *> sort array using the Bubble Sort method
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                01 n_terms CONSTANT as 10.
                01 i USAGE IS INDEX.
                01 j USAGE IS INDEX.
                01 last_idx USAGE IS INDEX.
                01 next_idx USAGE IS INDEX.
                01 temp PIC 99.
                01 swaped PIC 9 VALUE 1.
                LINKAGE SECTION.
                01 the_array.
                    02 rows OCCURS n_terms TIMES.
                        03 array PIC 99 VALUE ZERO.
            PROCEDURE DIVISION USING the_array.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > n_terms 
                                                    OR swaped = 0
                    MOVE 0 TO swaped
                    COMPUTE last_idx = n_terms - i - 1
                    PERFORM VARYING j FROM 1 BY 1 UNTIL j > last_idx
                        ADD 1 TO j GIVING next_idx
                        IF array(j) > array(next_idx) THEN
                            MOVE array(j) TO temp
                            MOVE array(next_idx) TO array(j)
                            MOVE temp TO array(next_idx)
                            MOVE 1 TO swaped
                        END-IF
                    END-PERFORM
                END-PERFORM.
            EXIT.
        END PROGRAM bubble_sort.
