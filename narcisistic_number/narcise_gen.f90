
FUNCTION narcisistic(number) result(is_narcise)
    INTEGER :: number, n_digits, dig, power
    LOGICAL :: is_narcise
    CHARACTER(len=12) :: s_number
    CHARACTER(len=1) :: s_char
    INTEGER, dimension(:), allocatable :: pow_list
    WRITE(s_number, *) number
    s_number = ADJUSTL(s_number)
    n_digits = len(trim(s_number))
    ! we could do it without the array, but allocating is much more fun
    IF (.not. allocated(pow_list)) THEN
        allocate(pow_list(n_digits))
    END IF
!     print *, "digits ", n_digits
    DO i = 1, n_digits
        s_char = s_number(i:i)
        READ(s_char, *) dig
        power = dig ** n_digits
        pow_list(i) = power
    END DO
    is_narcise = SUM(pow_list) == number
    deallocate(pow_list)
    RETURN
END FUNCTION

PROGRAM narcise_number
    INTEGER :: number, i
    LOGICAL :: narcisistic
    DO i = 10, 100000
        IF (narcisistic(i)) THEN
            print *, i
        END IF
    END DO
END PROGRAM
