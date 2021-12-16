package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Merge sort function. Sort the given array.
// :param array []int: the array to be sorted
func merge_sort(array []int) {
    var i, j, k , half int
    var left, right []int
    size := len(array)
    if size > 1 {
        // divide the array in two
        half = size / 2
        left = make([]int, half)
        right = make([]int, size - half)
        copy(left, array[0:half])
        copy(right, array[half:])
        // Call recursivelly
        merge_sort(left)
        merge_sort(right)
        // Merge back
        i = 0
        j = 0
        k = 0
        for i < len(left) && j < len(right) {
            if left[i] < right[j] {
                array[k] = left[i]
                i++
            } else {
                array[k] = right[j]
                j++
            }
            k++
        }
        // fill the rest
        for i < len(left) {
            array[k] = left[i]
            i++
            k++
        }
        for j < len(right) {
            array[k] = right[j]
            j++
            k++
        }
    }
}

// The main function
func main () {
    rand.Seed(time.Now().UnixNano())
    arr := make([]int, 10);
    for i:=0; i<len(arr); i++ {
        arr[i] = rand.Intn(99)
    }
    fmt.Println(arr)
    merge_sort(arr)
    fmt.Println(arr)
}
