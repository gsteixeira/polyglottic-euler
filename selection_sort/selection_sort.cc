#include <time.h>
#include <iostream>
#include <vector>

void selection_sort(std::vector<int>& array) {
    int min_value, min_idx;
    for (int i = 0; i < array.size() - 1; i++) {
        min_value = array[i];
        min_idx = i;
        // find the min number at right of position
        for (int k = i + 1; k < array.size(); k++) {
            if (array[k] < min_value) {
                min_idx = k;
                min_value = array[k];
            }
        }
        // if there is one, replace
        if (min_idx != i) {
            int temp = array[i];
            array[i] = array[min_idx];
            array[min_idx] = temp;
        }
    }
}

int main() {
    srand(time(0));
    // Initialize a vector
    std::vector<int> array;
    for (int i = 0; i < 15; i++) {
        array.push_back(rand() % 99);
        std::cout << array[i] << ", ";
    }
    // Sort
    selection_sort(array);

    // Show
    std::cout << "\n";
    for (auto value : array) {
        std::cout << value << ", ";
    }
    std::cout << "\n";
}
