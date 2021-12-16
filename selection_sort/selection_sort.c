/* 
 * Selection Sort
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


// Sort array using the Selection Sort method
void selection_sort(size_t size, int array[size]) {
    int i, j, min_val, min_idx, temp;
    for (i=0; i<size; i++) {
        min_val = array[i];
        min_idx = i;
        for (j=i+1; j<size; j++) {
            if (array[j] < min_val) {
                min_val = array[j];
                min_idx = j;
            }
        }
        if (min_val < array[i]) {
            temp = array[i];
            array[i] = array[min_idx];
            array[min_idx] = temp;
        }
    }
}

int main() {
    srand(time(NULL));
    int i;
    size_t size = 10;
    int arr[size];
    for (i=0; i<size; i++) {
        arr[i] = rand() % 99;
        printf("%d, ", arr[i]);
    }
    selection_sort(size, arr);
    printf("\n");
    for (i=0; i<size; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}
