#include <stdio.h>
#include <stdlib.h>

int next_collatz(int);
int *collatz_sequence(int);
int *longest_collatz_seq(int from);

int main () {
    int *result;
    result = longest_collatz_seq(10000);
    printf("Longest collatz sequence has %d elements for %d\n", result[1], result[0]);
}

int *collatz_sequence(int from) {
    // generates a collatz sequence for a given number.
    // return an array containing such sequence
    int *arr;
    int i, current, newsize, collatz = from;
    i = 0;
    arr = (int*) malloc(1 * sizeof(int));
    while (collatz > 0) {
        current = collatz;
        collatz = next_collatz(current);
        newsize = (i + 1) * sizeof(int);
        arr = realloc(arr, newsize);
        arr[i] = current;
        if (current == 1) { break; }
        i++;
        int size = sizeof(arr) / sizeof(arr[0]);
    }
    return arr;
}

int next_collatz(int number) {
    // return the next number for the sequence
    if ((number % 2) == 0) {
        return number / 2;
    } else {
        return 3 * number + 1;
    }
}

int count_collatz(int number) {
    // count how many items there are on the sequence
    int *sequence;
    int counter, size, value;
    sequence = collatz_sequence(number);
    counter = 0;
    do {
        value = sequence[counter];
        //printf("%d\n", value);
        counter++;
    } while (value > 1);
    free(sequence);
    return counter;
}


int *longest_collatz_seq(int from) {
    // find the longes sequence for a given number
    static int result[2];
    int *sequence;
    int i, count, longest_id, longest_count = 0;
    for (i=from; i>0; i--) {
        count = count_collatz(i);
        // printf("collatz count for %d : %d\n", i, count);
        if (count > longest_count) {
            longest_id = i;
            longest_count = count;
        }
    }
    result[0] = longest_id;
    result[1] = longest_count;
    return result;
}
