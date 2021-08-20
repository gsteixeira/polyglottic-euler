! Fibonacci sequence
PROGRAM fibonacci
    INTEGER :: nterms ! how many terms in our fibonacci sequence
    CHARACTER(len=32) :: arg
    INTEGER(kind=16) :: a, b, nth
    INTEGER :: counter
    CALL getarg(1, arg)
    IF (iargc() == 0) THEN
        print *, "usage:  command <number of terms>"
        ! call EXIT(1) ! let's use a default value
        arg = "25"
    END IF
    READ(arg, *) nterms
    a = 0
    b = 1
    nth = a
    DO counter = 1, nterms
        print *, a
        nth = a + b
        a = b
        b = nth
    END DO
END PROGRAM
