        *> Insertion Sort in Cobol
        IDENTIFICATION DIVISION.
            PROGRAM-ID. Main.
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                    01 datetime         PIC X(21).
                    01 seed             PIC S9(9) BINARY.
                    01 i USAGE IS INDEX.
                    01 array_size PIC 9999 VALUE 15.
                    01 array.
                        02 arr OCCURS 99 TIMES.
                            *> 03 array_value PIC 99 VALUES LOW-VALUES.
                            03 array_value PIC 9(9) COMP VALUES LOW-VALUES.
                    01 array_tx PIC 99 USAGE IS DISPLAY.
            PROCEDURE DIVISION.
                PERFORM seed_random.
                *> initialize the array with random values
                PERFORM VARYING i FROM 1 BY 1 UNTIL i >= array_size
                    COMPUTE array_value(i) = FUNCTION RANDOM * 99
                END-PERFORM.
                PERFORM print_array.
                CALL "insertion_sort" USING array, array_size.
                PERFORM print_array.
            STOP RUN.

            print_array.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i >= array_size
                    MOVE array_value(i) TO array_tx
                    DISPLAY array_tx ", " WITH NO ADVANCING
                END-PERFORM.
                DISPLAY SPACE.
                EXIT.

            seed_random.
                MOVE FUNCTION CURRENT-DATE TO datetime
                MOVE datetime(8:9) TO seed
                COMPUTE i = FUNCTION RANDOM (seed)
                EXIT.
        END PROGRAM Main.

        IDENTIFICATION DIVISION.
            PROGRAM-ID. insertion_sort.
            *> Order array using the Insertion Sort technique
            DATA DIVISION.
                WORKING-STORAGE SECTION.
                    01 i USAGE IS INDEX.
                    01 j USAGE IS INDEX.
                    01 k USAGE IS INDEX.
                    01 swaped PIC 9 VALUE 1.
                    01 temp PIC 9999.
                LINKAGE SECTION.
                    01 array_size PIC 9999.
                    01 the_array.
                        02 arr_rows OCCURS 1 TO 9999 TIMES
                                    DEPENDING ON array_size.
                            03 array PIC 9(9) COMP.
            PROCEDURE DIVISION USING the_array, array_size.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i >= array_size
                                                    OR swaped = 0
                    MOVE 0 TO swaped
                    PERFORM VARYING j FROM array_size BY -1 UNTIL j <= i
                        SUBTRACT 1 FROM j GIVING k
                        IF array(j) < array(k) THEN
                            MOVE array(j) TO temp
                            MOVE array(k) TO array(j)
                            MOVE temp TO array(k)
                            MOVE 1 TO swaped
                        END-IF
                    END-PERFORM
                END-PERFORM.
            GOBACK.
        END PROGRAM insertion_sort.
