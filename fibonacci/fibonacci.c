// display a fibonacci sequence
#include <stdio.h>

int main() {
    int i;
    int a, b, nth;
    a = 0;
    b = 1;
    for (i=0; i<25; i++){
        printf("%d\n", a);
        nth = a + b;
        a = b;
        b = nth;
    }
    return 0;
}

