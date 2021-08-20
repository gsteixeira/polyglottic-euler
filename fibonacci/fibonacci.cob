IDENTIFICATION DIVISION.
    PROGRAM-ID. fibonacci.
    AUTHOR. Gustavo Teixeira - gsteixei@gmail.com
    DATE-WRITTEN. 2021-07-03
    *> generates a fibonacci sequence
DATA DIVISION.
    WORKING-STORAGE SECTION.
        01 a         PIC 9(6) VALUE ZEROS.
        01 b         PIC 9(6) VALUE ZEROS.
        01 i         PIC 999 VALUE ZEROS.
        01 nth       PIC 9(6) VALUE ZEROS.
PROCEDURE DIVISION.
    MOVE 0 TO a.
    MOVE 1 TO b.
    PERFORM VARYING i FROM 1 BY 1 UNTIL i >= 25
        DISPLAY a
        COMPUTE nth = a + b
        MOVE b TO a
        MOVE nth TO b
    END-PERFORM
GOBACK RETURNING 0.

