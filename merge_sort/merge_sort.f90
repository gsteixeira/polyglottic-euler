! A merge sort in Fortran

module mergesort_mod
    ! The Merge Sort module
    implicit none
    contains
    !
    ! Slice Array. From "src" into "slice". From positions given by
    !               start -> end_pos.
    subroutine slice_array(src, slice, start, end_pos)
        implicit none
        integer, dimension(:), intent(in) :: src
        integer, allocatable, dimension(:), intent(inout) :: slice
        integer, intent(in) :: start, end_pos
        integer :: array_size, i, k
        !
        array_size = end_pos - start + 1
        if (.not. allocated(slice)) then
            allocate(slice(array_size))
        end if
        k = 1
        do i = start, end_pos
            slice(k) = src(i)
            k = k + 1
        end do
    end subroutine slice_array
    !
    ! Join two arrays in order.
    subroutine join_inorder(array, left, right)
        implicit none
        integer, dimension(:), intent(inout) :: array, left, right
        integer :: i, j, k
        i = 1
        j = 1
        k = 1
        do while (i <= size(left) .and. j <= size(right))
            if (left(i) < right(j)) then
                array(k) = left(i)
                i = i + 1
            else
                array(k) = right(j)
                j = j + 1
            end if
            k = k + 1
        end do
        ! Finish
        do while (i <= size(left))
            array(k) = left(i)
            i = i + 1
            k = k + 1
        end do
        do while (j <= size(right))
            array(k) = right(j)
            j = j + 1
            k = k + 1
        end do
    end subroutine join_inorder
    
    ! Print the array
    subroutine print_array(array)
        implicit none
        integer, dimension(:), intent(in) :: array
        integer :: i
        !
        do i = 1, size(array)
            write(*,'(1x,i0)',advance='no') array(i)
        end do
        print *, ""
    end subroutine print_array

    ! The Merge Sort function. Sorts the array.
    ! :param array integer[]: the array.
    ! :param array_size integer: the size of the array.
    recursive subroutine merge_sort(array, array_size)
        implicit none
        integer, intent(in) :: array_size
        integer, dimension(array_size), intent(inout) :: array
        integer, allocatable, dimension(:) :: left, right
        integer :: half, right_size, i, j, k
        !
        if (array_size > 1) then
            half = array_size / 2
            right_size = array_size - half
            ! Slice the arrays in two
            call slice_array(array, left, 1, half)
            call slice_array(array, right, half+1, array_size)
            ! Call recursively
            call merge_sort(left, half)
            call merge_sort(right, right_size)
            ! Merge the array back
            call join_inorder(array, left, right)
        end if
        ! Release memory
        if (allocated(left)) then
            deallocate(left)
        end if
        if (allocated(right)) then
            deallocate(right)
        end if
    end subroutine merge_sort

end module mergesort_mod


! Main program
program msort
    use mergesort_mod
    implicit none
    integer :: i
    integer, dimension(10) :: arr
    ! Declare a sample array
    arr = (/9, 7, 8, 6, 5, 128, 3, 4, 1, 2/)
    call print_array(arr)
    call merge_sort(arr, size(arr))
    call print_array(arr)
end program
