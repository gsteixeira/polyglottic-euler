# generate a sequence of prime numbers
is_prime <- function(number){
    # check if a number is prime
    for (i in seq(2, number)) {
        if (i == number) { break }
        remainder <- number %% i
        if (remainder == 0) {
            return(FALSE)
        }    
    }
    return(TRUE)
}

for (val in 2:99) {
    if (is_prime(val)){
        print(val)
    }
}
