IDENTIFICATION DIVISION.
    PROGRAM-ID. primes.
    AUTHOR. gsteixei@gmail.com
    DATE-WRITTEN. 2021-07-03
    *> generates prime numbers
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 num       PIC 9(3) VALUE ZEROS.
        01 divisor   PIC 9(8) VALUE ZEROS.
        01 isprime   PIC 9 VALUE ZEROS.
PROCEDURE DIVISION.
    PERFORM VARYING num FROM 1 BY 1 UNTIL num = 99
        MOVE 1 TO isprime
        PERFORM VARYING divisor FROM 2 BY 1 UNTIL divisor >= num
            IF FUNCTION REM(num, divisor) = 0 THEN
                MOVE 0 TO isprime
                EXIT PERFORM
            END-IF
        END-PERFORM
        IF isprime = 1 THEN DISPLAY num END-IF
    END-PERFORM
STOP RUN.
