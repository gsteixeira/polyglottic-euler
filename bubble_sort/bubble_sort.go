// Bubble Sort in Go
//
package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Order an array using the Bubble Sort method
func bubble_sort(array []int) {
    var j int
    var swaped bool
    for i := range array {
        swaped = false
        for j=0; j<len(array) - i - 1; j++ {
            if array[j] > array[j+1] {
                array[j+1], array[j] = array[j], array[j+1]
                swaped = true
            }
        }
        if !swaped { break }
    }
}

// The main function
func main() {
    rand.Seed(time.Now().UnixNano())
    arr := make([]int, 10);
    for i:=0; i<len(arr); i++ {
        arr[i] = rand.Intn(99)
    }
    fmt.Println(arr)
    bubble_sort(arr)
    fmt.Println(arr)
}
