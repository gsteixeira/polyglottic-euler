
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
    var powlist []float64
    s_number := strconv.Itoa(number)
    digits := len(s_number)
    for _, char := range s_number{
        dig, err := strconv.Atoi(string(char))
        if err != nil { panic(err) }
        power := math.Pow(float64(dig), float64(digits))
        powlist = append(powlist, power)
    }
    var total float64 = 0 
    for _, value := range powlist {
        total += value
    }
    return (int(total) == number)
}
