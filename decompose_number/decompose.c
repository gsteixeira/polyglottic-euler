// compile with gcc -lm
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// IntVector has a pointer to array and it's size
struct IntVector_s {
    int *array;
    int length;
} IntVector_default = {NULL, 0};

typedef struct IntVector_s IntVector;
IntVector decompose_integer(int);
void reverse_array(int*, int);

int main() {
    int i;
    IntVector elements;
    elements = decompose_integer(123457);
    for (i=0; i<elements.length; i++) {
        printf("%d\n", elements.array[i]);
    }
    free(elements.array);
}


IntVector decompose_integer(int number) {
    int remainder, i = 0;
    IntVector elements = IntVector_default;
    while (number > 0) {
        remainder = (number % 10);
        number = floor(number / 10);
        elements.array = realloc(elements.array, elements.length+1);
        elements.array[i] = remainder;
        // printf("%d-%d\n", i, elements.array[i]);
        elements.length = ++i;
    }
    reverse_array(elements.array, elements.length);
    return elements;
}

void reverse_array(int *array, int size){
    // reverse and array of given size
    int i, j;
    int i_value, j_value;
    i = 0;
    j = size -1;
    while (i < j) {
        i_value = array[i];
        j_value = array[j];
        array[i] = j_value;
        array[j] = i_value;
        i++;
        j--;
    }
}
