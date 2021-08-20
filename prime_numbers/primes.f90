! Prints a sequence of prime numbers
! 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31

FUNCTION is_prime(number) result(prime)
    ! Check if a number is prime
    LOGICAL :: prime
    INTEGER :: number, i
    REAL :: div
    prime = .false.
    DO i = 2, number - 1
        div = number / real(i)
        IF (div .EQ. FLOOR(div)) THEN
            RETURN
        END IF
    END DO
    prime = .true.
END FUNCTION

PROGRAM findPrimes
    CHARACTER(len=32) :: arg
    INTEGER :: upto, i
    LOGICAL :: is_divisible, is_prime
    upto = 99
    DO i = 1, upto
        IF (is_prime(i)) THEN
            print *, "prime", i
        END IF
    END DO
END PROGRAM
