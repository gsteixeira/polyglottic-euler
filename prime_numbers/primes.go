package main
import "fmt"

const N_NUMBERS = 99

func main () {
    for i := 2; i < N_NUMBERS; i++ {
        if (is_prime(i)){
            fmt.Println(i)
        }
    }
}

func is_prime(number int) bool {
    // tell if a number is prime
    for i := 2; i < number; i++ {
        if ((number % i) == 0) {
            return false
        }
    }
    return true
}
