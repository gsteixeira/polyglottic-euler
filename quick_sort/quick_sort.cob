        *> Quick Sort in Cobol
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
                            03 array_value PIC 99 VALUES LOW-VALUES.
            PROCEDURE DIVISION.
                PERFORM seed_random.
                *> initialize the array with random values
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > array_size
                    COMPUTE array_value(i) = FUNCTION RANDOM * 99
                END-PERFORM.
                PERFORM print_array.
                CALL "quick_sort" USING array, array_size.
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
            PROGRAM-ID. quick_sort IS RECURSIVE.
            *> Sort array using the Quick Sort method
            DATA DIVISION.
                LOCAL-STORAGE SECTION.
                    01 i USAGE IS INDEX.
                    01 j USAGE IS INDEX.
                    01 pivot_idx USAGE IS INDEX.
                    01 center_size PIC 9999 VALUE 0.
                    01 center_arr.
                        02 center_rows OCCURS 1 TO 9999 TIMES
                                        DEPENDING ON array_size.
                            03 center_array PIC 99.
                    01 left_size PIC 9999 VALUE 0.
                    01 left_arr.
                        02 left_rows OCCURS 1 TO 9999 TIMES
                                        DEPENDING ON array_size.
                            03 left_array PIC 99.
                    01 right_size PIC 9999 VALUE 0.
                    01 right_arr.
                        02 right_rows OCCURS 1 TO 9999 TIMES
                                        DEPENDING ON array_size.
                            03 right_array PIC 99.
                LINKAGE SECTION.
                    01 array_size PIC 9999.
                    01 the_array.
                        02 array_rows OCCURS 1 TO 9999 TIMES
                                        DEPENDING ON array_size.
                            03 array PIC 99.
                                
            PROCEDURE DIVISION USING the_array, array_size.
                IF array_size <= 1 THEN
                    GOBACK
                END-IF
                COMPUTE pivot_idx = FUNCTION RANDOM * array_size + 1
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > array_size
                    EVALUATE TRUE
                        WHEN array(i) < array(pivot_idx)
                            ADD 1 TO left_size
                            MOVE array(i) TO left_array(left_size)
                        WHEN array(i) > array(pivot_idx)
                            ADD 1 TO right_size
                            MOVE array(i) TO right_array(right_size)
                        WHEN array(i) = array(pivot_idx)
                            ADD 1 TO center_size
                            MOVE array(i) TO center_array(center_size)
                    END-EVALUATE
                END-PERFORM.
                CALL 'quick_sort' USING left_arr, left_size.
                CALL 'quick_sort' USING right_arr, right_size.
                MOVE 1 TO j.
                PERFORM VARYING i FROM 1 BY 1 UNTIl i > left_size
                    MOVE left_array(i) TO array(j)
                    ADD 1 TO j
                END-PERFORM.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > center_size
                    MOVE center_array(i) TO array(j)
                    ADD 1 TO j
                END-PERFORM.
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > right_size
                    MOVE right_array(i) TO array(j)
                    ADD 1 TO j
                END-PERFORM.
            GOBACK.
        END PROGRAM quick_sort.
            
