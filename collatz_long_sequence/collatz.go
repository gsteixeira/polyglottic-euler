package main
import "fmt"

func main () {
    // fmt.Println(collatz_sequence(13))
    result := longest_collatz_seq(10000)
    fmt.Println("Longest collatz sequence has", result[1], 
                "elements for ", result[0])
}

func next_collatz(number int) int {
    // return the next collatz number
    if number == 1 {
        return 1
    } else if (number % 2) == 0 {
        return number / 2
    } else {
        return 3 * number + 1
    }
}

func collatz_sequence(number int) []int {
    // return the collatz sequence for a given number
    var arr []int
    collatz := number
    for collatz > 0 {
        current := collatz
        collatz = next_collatz(current)
        arr = append(arr, current)
        if current == 1 { break }
    }
    return arr
}

func longest_collatz_seq(from int) [2]int {
    // Find the longuest collatz sequence
    var longest_id, longest_count int
    longest_count = 0
    for i:=from; i>0; i-- {
        sequence := collatz_sequence(i)
        size := len(sequence)
        if size > longest_count {
            longest_id = i
            longest_count = size
        }
    }
    return [2]int{longest_id, longest_count}
}
