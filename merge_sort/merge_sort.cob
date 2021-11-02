
        IDENTIFICATION DIVISION.
            PROGRAM-ID. Main.
            AUTHOR. Gustavo Selbach Teixeira.
            *> a Merge Sort in Cobol :)
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                    01 datetime         PIC X(21).
                    01 seed             PIC S9(9) BINARY.
                    01 i USAGE IS INDEX.
                    01 array.
                        02 arr OCCURS 99 TIMES.
                            03 array_value PIC 99 VALUES LOW-VALUES.
            PROCEDURE DIVISION.
                PERFORM seed_random.
                *> initialize the array with random values
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > 10
                    COMPUTE array_value(i) = FUNCTION 
                                            RANDOM * (99 - 0 + 1) + 0
                END-PERFORM.
                *> show
                PERFORM print_array.
                DISPLAY "# Ordering..."
                CALL "merge_sort" USING array.
                PERFORM print_array.
            STOP RUN.

            print_array.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > 10
                    DISPLAY array_value(i)
                END-PERFORM.
                EXIT.

            seed_random.
                MOVE FUNCTION CURRENT-DATE TO datetime
                MOVE datetime(8:9) TO seed
                COMPUTE i = FUNCTION RANDOM (seed)
                EXIT.
        END PROGRAM Main.


        IDENTIFICATION DIVISION.
            PROGRAM-ID. merge_sort IS RECURSIVE.
            *> The Merge sort function.
            DATA DIVISION.
                LOCAL-STORAGE SECTION.
                    01 i USAGE IS INDEX.
                    01 j USAGE IS INDEX.
                    01 k USAGE IS INDEX.
                    01 half PIC 99 COMP.
                    01 array_size PIC 99 COMP.
                    *> local arrays to copy
                    01 left_array.
                        02 arr_left OCCURS 50 TIMES.
                            03 left_value PIC 99 VALUE LOW-VALUE.
                    01 right_array.
                        02 arr_right OCCURS 50 TIMES.
                            03 right_value PIC 99 VALUE LOW-VALUE.
                    01 right_size PIC 99 VALUE ZERO.
                LINKAGE SECTION.
                    01 array.
                        02 arr OCCURS 99 TIMES.
                            03 array_value PIC 99.
            PROCEDURE DIVISION USING array.
                PERFORM get_array_size.
                IF array_size > 1 THEN
                    *> slice the array in two
                    DIVIDE array_size BY 2 GIVING half
                    PERFORM slice_left_array
                    PERFORM slice_right_array
                    *> call recursively
                    CALL "merge_sort" USING left_array
                    CALL "merge_sort" USING right_array
                    *> merge the array back again
                    MOVE 1 TO i
                    MOVE 1 TO j
                    MOVE 1 TO k
                    *> let us be Cobolonics. XD
                    *> the line...
                    *> COMPUTE right_size = array_size - half
                    *> ..can be more cobolonic if written like this:
                    SUBTRACT half FROM array_size GIVING right_size
                    PERFORM UNTIL i > half OR j > right_size
                        IF left_value(i) < right_value(j) THEN
                            MOVE left_value(i) TO array_value(k)
                            ADD 1 TO i
                        ELSE
                            MOVE right_value(j) TO array_value(k)
                            ADD 1 TO j
                        END-IF
                        ADD 1 TO k
                    END-PERFORM
                    *> finish
                    PERFORM UNTIL i > half
                        MOVE left_value(i) TO array_value(k)
                        ADD 1 TO i
                        ADD 1 TO k
                    END-PERFORM
                    PERFORM UNTIL j > right_size
                        MOVE right_value(j) TO array_value(k)
                        ADD 1 TO j
                        ADD 1 TO k
                    END-PERFORM
                END-IF.
            GOBACK.

            slice_left_array.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > half
                    MOVE array_value(i) TO left_value(i)
                END-PERFORM.
                EXIT.

            slice_right_array.
                MOVE 1 TO i.
                ADD 1 TO half GIVING k.
                PERFORM VARYING j FROM k BY 1 UNTIL j > array_size
                    MOVE array_value(j) TO right_value(i)
                    ADD 1 TO i
                END-PERFORM.
                EXIT.

            get_array_size.
                *> MOVE 0 TO array_size.
                MOVE 1 TO i.
                PERFORM UNTIL array_value(i) = LOW-VALUES
                    ADD 1 TO i
                END-PERFORM.
                SUBTRACT 1 FROM i GIVING array_size.
                EXIT.
        END PROGRAM merge_sort.
