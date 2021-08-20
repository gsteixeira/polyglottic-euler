// display a fibonacci sequence
package main
import "fmt"

func main() {
    var a, b, nth, upto int;
    upto = 25
    a = 0
    b = 1
    fmt.Println(a)
    fmt.Println(b)
    for i := 0; i<upto; i++ {
        nth = a + b
        a = b
        b = nth
        fmt.Println(nth)
    }
}
