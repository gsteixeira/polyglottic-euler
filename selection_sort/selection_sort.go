// Selection Sort
package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Order the array using the Selection Sort method
func selection_sort(array []int) {
    var min_val, min_idx, j int;
    for i := range array {
        min_val = array[i];
        for j=i+1; j<len(array); j++ {
            if array[j] < min_val {
                min_val, min_idx = array[j], j
            }
        }
        if array[i] > min_val {
            array[i], array[min_idx] = array[min_idx], array[i]
        }
    }
}

// The main function
func main() {
    rand.Seed(time.Now().UnixNano())
    // Creates a random array
    arr := make([]int, 15);
    for i:=0; i<len(arr); i++ {
        arr[i] = rand.Intn(99)
    }
    fmt.Println(arr)
    selection_sort(arr)
    fmt.Println(arr)
}
