package main
import "fmt"

func main() {
    fmt.Println("the array ", decompose_integer(12345))
    arr := decompose_integer(12345)
    for _, elm := range arr{
        fmt.Println(elm)
    }
}

func decompose_integer(number int) []int {
    // decompose integer into digits returning an array of it's elements
    var elements []int
    var remainder int
    for number > 0 {
        remainder = number % 10
        number = number / 10
        elements = append(elements, remainder)
    }
    elements = reverse_int_array(elements)
    return elements
}

func reverse_int_array(array []int) []int {
    // reverse and array of integers
    var i, j int
    i = 0
    j = len(array) - 1
    for i < j {
        array[i], array[j] = array[j], array[i]
        i++
        j--
    }
    return array
}
