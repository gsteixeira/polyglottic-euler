#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// split an array returning the part defined by start, end.
void split(int *array, int *dest, int start, int end){
    int i, k, slice_size;
    k = 0;
    slice_size = end - start;
    for (i=start; i<end; i++) {
        dest[k] = array[i];
        k++;
    }
}

// Merge Sort function. Do the sorting.
// :param size size_t: the size of the array
// :param array int: the array
void merge_sort(size_t size, int array[size]) {
    int half, right_size, i, j, k;
    half = size / 2;
    right_size = size - half;
    int left[half];
    int right[right_size];
    if (size > 1) {
        // Split the arrays
        split(array, left, 0, half);
        split(array, right, half, size);
        // Call recursivelly
        merge_sort(half, left);
        merge_sort(right_size, right);
        // Join ordely
        i = j = k = 0;
        while (i < half && j < right_size) {
            if (left[i] < right[j]) {
                array[k] = left[i];
                i++;
            } else {
                array[k] = right[j];
                j++;
            }
            k++;
        }
        // Finish
        while (i < half) {
            array[k] = left[i];
            i++;
            k++;
        }
        while (j < right_size) {
            array[k] = right[j];
            j++;
            k++;
        }
    }
}

// The main function
int main() {
    srand(time(NULL));
    size_t size = 10;
    int arr[size];
    int i;
    // seed random.
    srand(time(NULL));
    // initialize array with random numbers
    for (i=0; i<size; i++) {
        arr[i] = rand() % 99;
        printf("%d, ", arr[i]);
    }
    printf("\n");
    merge_sort(size, arr);
    // Show result
    for (i=0; i<size; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}
