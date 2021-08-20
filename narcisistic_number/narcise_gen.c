//  gcc -lm narcisistic.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>

int is_narcise(int);

int main () {
    int i;
    for (i=10; i<100000; i++){
        if (is_narcise(i)) {
            printf("%d\n", i);
        }
    }
}

int is_narcise(int number) {
    // tell if a number is narcisistic
    char s_number[5];
    char ch;
    int i, digits, total, power, dig;
    sprintf(s_number, "%d", number);
    s_number[5] = '\0';
    digits = strlen(s_number);
    total = 0;
    for (i=0; i<digits; i++){
        ch = (char)s_number[i];
        dig = ch - '0';
        power = pow(dig, digits);
        total += power;
    }
    return total == number;
}
