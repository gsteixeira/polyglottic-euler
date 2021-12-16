// Quick Sort in Go
package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Sort array using the Quick Sort technique
func quicksort(array []int) []int {
    var idx int
    if len(array) <= 1 {
        return array
    }
    idx = rand.Intn(len(array))
    center := make([]int, 0)
    left := make([]int, 0)
    right := make([]int, 0)
    for _, x := range array {
        if x < array[idx] {
            left = append(left, x)
        } else if x > array[idx] {
            right = append(right, x)
        } else {
            center = append(center, x)
        }
    }
    array = append(quicksort(left), center...)
    array = append(array, quicksort(right)...)
    return array
}

func main() {
    rand.Seed(time.Now().UnixNano())
    // Creates a random array
    arr := make([]int, 15);
    for i:=0; i<len(arr); i++ {
        arr[i] = rand.Intn(99)
    }
    fmt.Println(arr)
    result := quicksort(arr)
    fmt.Println(result)
}
