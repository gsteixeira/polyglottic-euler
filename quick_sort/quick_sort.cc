#include<iostream>
#include<vector>
#include<time.h>

std::vector<int> quick_sort(std::vector<int> array) {
    if (array.size() <= 1) {
        return array;
    }
    std::vector<int> left, right, center;
    int pivot = (int)(array.size() / 2);

    for (int value : array) {
        if (value > array[pivot]) {
            right.push_back(value);
        }
        else if (value < array[pivot]) {
            left.push_back(value);
        }
        else {
            center.push_back(value);
        }
    }
    left = quick_sort(left);
    right = quick_sort(right);

    left.insert(left.end(), center.begin(), center.end());
    left.insert(left.end(), right.begin(), right.end());
    return left;
}

int main() {
    srand(time(0));
    std::vector<int> array, result;
    // initialize the array with randoms
    for (int i = 0; i< 15; i++) {
        array.push_back(rand() % 99);
        std::cout << array[i] << ", ";
    }

    // Sort the array
    result = quick_sort(array);

    // Show result
    std::cout << "\n";
    for (int value : result) {
        std::cout << value << ", ";
    }
    std::cout << "\n";
}
