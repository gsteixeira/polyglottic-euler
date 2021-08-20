#include <stdio.h>

int is_prime(int);

int main () {
    int i;
    for (i=0; i<99; i++){
        if (is_prime(i)) {
            printf("%d\n", i);
        }
    }
}

int is_prime(int number) {
    // tell if a number is prime
    int i;
    for (i = 2; i < number; i++) {
        if ((number % i) == 0) {
            return 0;
        }
    }
    return 1;
}
