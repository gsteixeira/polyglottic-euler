/* 
 *  Bubble Sort in C
 */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Sort array using the Bubble Sort method
void bubble_sort(size_t arr_size, int array[arr_size]){
    int i, j, swaped, temp;
    for (i=0; i<arr_size; i++) {
        swaped = 0;
        for (j=0; j<arr_size - i - 1; j++) {
            if (array[j+1] < array[j]) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
                swaped = 1;
            }
        }
        if (!swaped) {
            break;
        }
    }
}

int main() {
    srand (time(NULL));
    int i;
    int arr[10];
    size_t size = sizeof(arr) / sizeof(arr[0]);
    for (i=0; i<size; i++) {
        arr[i] = rand() % 99;
        printf("%d, ", arr[i]);
    }
    bubble_sort(size, arr);
    printf("\n");
    for (i=0; i<size; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}
