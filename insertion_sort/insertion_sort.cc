#include <iostream>
#include <time.h>
#include <vector>

void insertion_sort(std::vector<int>& array) {
    for (int item : array) {
        bool swap = false;
        for (int i = array.size() - 1; i > 0; i--) {
            int previous = i-1;
            if (array[i] < array[previous]) {
                int temp = array[i];
                array[i] = array[previous];
                array[previous] = temp;
                swap = true;
            }
        }
        if (!swap) break;
    }
}

int main() {
    srand(time(0));

    std::vector<int> array;
    for (int i =0; i<15; i++) {
        array.push_back(rand() % 99);
        std::cout << array[i] << ", ";
    }

    insertion_sort(array);

    std::cout << "\n";
    for (auto value : array) {
        std::cout << value << ", ";
    }
    std::cout << "\n";
}
