// Quick Sort

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Sort array using the Quick Sort method
void quick_sort(size_t size, int *array) {
    int pivot_idx, i, j;
    int *center, *left, *right;
    size_t left_size, center_size, right_size;
    if (size <= 1) {
        return;
    }
    pivot_idx = (rand() % size);
    center = malloc(sizeof(int*));
    left = malloc(sizeof(int*));
    right = malloc(sizeof(int*));
    j = 0;
    center_size = left_size = right_size = 0;
    for (i=0; i<size; i++) {
        if (array[i] < array[pivot_idx]) {
            left = realloc(left, (left_size+1) * sizeof(int*));
            left[left_size++] = array[i];
        } else if (array[i] > array[pivot_idx]) {
            right = realloc(right, (right_size+1) * sizeof(int*));
            right[right_size++] = array[i];
        } else {
            center = realloc(center, (center_size+1) * sizeof(int*));
            center[center_size++] = array[i];
        }
    }
    quick_sort(left_size, left);
    quick_sort(right_size, right);
    j = 0;
    for (i=0; i<left_size; i++) {
        array[j++] = left[i];
    }
    for (i=0; i<center_size; i++) {
        array[j++] = center[i];
    }
    for (i=0; i<right_size; i++) {
        array[j++] = right[i];
    }
    free(left);
    free(right);
    free(center);
}

// Main function
int main() {
    srand (time(NULL));
    int i;
    size_t size = 15;
    int arr[size];
    // Creates a random array
    for (i=0; i<size; i++) {
        arr[i] = rand() % 99;
        printf("%d, ", arr[i]);
    }
    // Sort
    quick_sort(size, arr);
    // Show
    printf("\n");
    for (i=0; i<size; i++) {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}
