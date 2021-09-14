// show a list of prime numbers

// tell if a number is prime
function is_prime(num){
    for (var i=2; i<num-1; i++) {
        if (num % i == 0){
            return false
        }
    }
    return true;
}

// list the prime numbers
for (var i=1; i<99; i++){
    if (is_prime(i)){
        console.log(i);
    }
}
