IDENTIFICATION DIVISION.
    PROGRAM-ID. Main.
    DATA DIVISION.
        WORKING-STORAGE SECTION.
            01 datetime         PIC X(21).
            01 seed             PIC S9(9) BINARY.
            01 i USAGE IS INDEX.
            01 array_size PIC 99 VALUE 15.
            01 array.
                02 arr OCCURS 99 TIMES.
                    03 array_value PIC 99 VALUES LOW-VALUES.
    PROCEDURE DIVISION.
        PERFORM seed_random.
        *> initialize the array with random values
        PERFORM VARYING i FROM 1 BY 1 UNTIL i > array_size
            *> COMPUTE array_value(i) = FUNCTION RANDOM * (99 - 0 + 1) + 0
            COMPUTE array_value(i) = FUNCTION RANDOM * 99
        END-PERFORM.
        PERFORM print_array.
        CALL "selection_sort" USING array.
        PERFORM print_array.
    STOP RUN.

    print_array.
        PERFORM VARYING i FROM 1 BY 1 UNTIL i > array_size
            DISPLAY array_value(i) ", " WITH NO ADVANCING
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
    PROGRAM-ID. selection_sort.
    DATA DIVISION.
        LOCAL-STORAGE SECTION.
            01 i USAGE IS INDEX.
            01 j USAGE IS INDEX.
            01 k USAGE IS INDEX.
            01 temp PIC 99 COMP.
            01 array_size PIC 99 COMP.
            01 min_value PIC 99 COMP VALUE 0.
            01 min_idx USAGE IS INDEX.
            01 swaped PIC 99 VALUE 1.
        LINKAGE SECTION.
            01 the_array.
                02 arr OCCURS 99 TIMES.
                    03 array PIC 99.
    PROCEDURE DIVISION USING the_array.
        PERFORM get_array_size.
        *> Do the sorting
        PERFORM VARYING i FROM 1 BY 1 UNTIL i > array_size
            MOVE array(i) TO min_value
            MOVE i TO min_idx
            ADD 1 TO i GIVING k
            PERFORM VARYING j FROM k BY 1 UNTIL j > array_size
                IF array(j) < min_value
                    MOVE array(j) TO min_value
                    MOVE j TO min_idx
                END-IF
            END-PERFORM
            IF min_value < array(i) THEN
                MOVE array(i) TO temp
                MOVE array(min_idx) TO array(i)
                MOVE temp TO array(min_idx)
            END-IF
        END-PERFORM
        GOBACK.
    get_array_size.
        MOVE 1 TO i.
        PERFORM UNTIL array(i) = LOW-VALUES
            ADD 1 TO i
        END-PERFORM.
        SUBTRACT 1 FROM i GIVING array_size.
        EXIT.
END PROGRAM selection_sort.
