package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Sort array using the Insertion Sort technique
func insertion_sort(array []int) {
    for i := range array {
        swaped := false
        for j:=len(array)-1; j>i; j-- {
            if array[j] < array[j-1] {
                array[j], array[j-1] = array[j-1], array[j]
                swaped = true
            }
        }
        if !swaped { break }
    }
}

// The main function
func main() {
    rand.Seed(time.Now().UnixNano())
    arr := make([]int, 15);
    for i:=0; i<len(arr); i++ {
        arr[i] = rand.Intn(99)
    }
    fmt.Println(arr);
    insertion_sort(arr);
    fmt.Println(arr);
}
