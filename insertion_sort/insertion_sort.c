/*
 * Insertion Sort
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Sort array using the Insertion Sort method
void insertion_sort(size_t arr_size, int array[arr_size]) {
    int i, j, temp;
    for (i=0; i<arr_size; i++) {
        for (j=arr_size-1; j>i; j--) {
            if (array[j] < array[j-1]) {
                temp = array[j];
                array[j] = array[j-1];
                array[j-1] = temp;
            }
        }
    }
}

int main() {
    srand(time(NULL));
    int i;
    int arr[10];
    size_t size = sizeof(arr) / sizeof(arr[0]);
    for (i=0; i<size; i++) {
        arr[i] = rand() % 99;
        printf("%d, ", arr[i]);
    }
    insertion_sort(size, arr);
    printf("\n");
    for (i=0; i<size; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}
