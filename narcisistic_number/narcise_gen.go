
package main
import "fmt"
import "math"
import "strconv"
func main () {
    for i:=10; i<100000; i++ {
        if (narcisistic(i)){
            fmt.Println(i)
        }
    }
}

func narcisistic(number int) bool {
    // tell if a given number is a narcisistic one
    s_number := strconv.Itoa(number)
    digits := len(s_number)
    var total float64 = 0
    for _, char := range s_number{
        dig, err := strconv.Atoi(string(char))
        if err != nil { panic(err) }
        power := math.Pow(float64(dig), float64(digits))
        total += power
    }
    return (int(total) == number)
}
