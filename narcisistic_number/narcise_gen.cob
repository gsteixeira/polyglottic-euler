
IDENTIFICATION DIVISION.
    PROGRAM-ID. narcisistic.
        AUTHOR. Gustavo S. Teixeira
        DATE-WRITTEN. 2021-08-17.
    DATA DIVISION.
        WORKING-STORAGE SECTION.
            01 val          PIC 9(6) VALUE ZEROS.
            01 is_narcise   PIC 9 VALUE ZEROS.
    PROCEDURE DIVISION.
    mainline.
        MOVE 152 TO val.
        PERFORM checkit.
        PERFORM VARYING val FROM 10 BY 1 UNTIL val > 100000
            *> DISPLAY val
            PERFORM checkit
        END-PERFORM.
    STOP RUN.
        
    checkit.
        CALL 'is_narcisistic' 
            USING val GIVING is_narcise.
        IF is_narcise = 1 THEN
            DISPLAY val
        END-IF.
        EXIT.
END PROGRAM narcisistic.

IDENTIFICATION DIVISION.
    PROGRAM-ID. is_narcisistic.
    DATA DIVISION.
        WORKING-STORAGE SECTION.
            01 working_vars.
                02 str_number   PIC X(6) VALUE SPACES.
                02 digits       PIC 9 VALUE ZEROS.
                02 pow_list OCCURS 6 TIMES.
                    03 power        USAGE IS COMP-1.
                02 total        USAGE IS COMP-1 VALUE ZERO.
                02 i            PIC 9 VALUE ZERO.
                02 s_char       PIC X VALUE SPACE.
                02 dig          REDEFINES s_char PIC 9.
            01 returning_value.
                02 is_narcise  PIC 9.
        LINKAGE SECTION.
            01 num         PIC 9(6).
    PROCEDURE DIVISION USING num.
        MOVE num TO str_number.
        INSPECT str_number REPLACING LEADING ZEROES BY SPACES.
        MOVE FUNCTION trim(str_number) TO str_number.
        *> MOVE FUNCTION length(FUNCTION trim(str_number)) TO digits.
        MOVE FUNCTION length(FUNCTION trim(str_number)) TO digits.
        MOVE 0 TO total.
        PERFORM VARYING i FROM 1 BY 1 UNTIL i > digits
            MOVE str_number(i:1) TO s_char
            COMPUTE power(i) = dig ** digits
            ADD power(i) TO total
        END-PERFORM.
        *> DISPLAY "TOTAL " total " num " num.
        IF total = num THEN
            MOVE 1 TO is_narcise
        ELSE
            MOVE 0 TO is_narcise
        END-IF
        GOBACK RETURNING is_narcise.
END PROGRAM is_narcisistic.
