#include<time.h>
#include<vector>
#include<iostream>

void bubble_sort(std::vector<int>& array) {
    for (int i = 0; i < array.size(); i++) {
        bool swapped = false;
        int check_until = array.size() - i - 1;

        for (int k = 0; k < check_until; k++) {
            if (array[k] > array[k+1]) {
                int temp = array[k];
                array[k] = array[k+1];
                array[k+1] = temp;

                swapped = true;
            }
        }

        if (!swapped) break;
    }
}


int main () {
    srand(time(0));
    std::vector<int> array;

    for (int i = 0; i < 15; i++) {
        array.push_back(rand() % 99);
        std::cout << array[i] << ", ";
    }

    bubble_sort(array);

    std::cout << "\n";
    for (int value : array) {
        std::cout << value << ", ";
    }
}
