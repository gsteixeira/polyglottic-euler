! in fortran we used only the recursive form

RECURSIVE FUNCTION collatz_counter(number) result(counter)
    INTEGER(kind=16) :: number, counter
    IF (number == 1) THEN
        counter = 1
    ELSE IF (MOD(number, 2) .eq. 0) THEN
        counter = 1 + collatz_counter(number / 2)
    ELSE
        counter = 1 + collatz_counter(3 * number + 1)
    END IF
END FUNCTION

SUBROUTINE get_longest_collatz(from) ! result(res)
    INTEGER(kind=16) :: i, counter, longest_id, longest_count
    INTEGER :: from
    INTEGER(kind=16) :: collatz_counter, seqsize
    longest_count = 0
    DO i = from, 1, -1
        seqsize = collatz_counter(i)
        IF (seqsize > longest_count) THEN
            longest_count = seqsize
            longest_id = i
        END IF
    END DO
    print *, "Longest collatz sequence has", longest_count, "elements for", longest_id
END SUBROUTINE

PROGRAM main
    INTEGER :: collatz_counter, i, counter, longest_id, longest_count, seqsize
    INTEGER, dimension(2) :: res
    call get_longest_collatz(10000)
END PROGRAM
