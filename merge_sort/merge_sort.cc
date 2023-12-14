#include <iostream>
#include <vector>
#include <math.h>


void merge_sort(std::vector<int>& array) {
    if (array.size() < 2) return;

    int half = floor(array.size() / 2);
    std::vector<int> left, right;

    left = std::vector<int>(array.begin(), array.begin() + half);
    right = std::vector<int>(array.begin() + half, array.end());

    merge_sort(left);
    merge_sort(right);

    // merge them back
    int i, l, r;
    i = 0;
    l = 0;
    r = 0;
    while (l < left.size() && r < right.size()) {
        if (left[l] < right[r]) {
            array[i] = left[l];
            l++;
        } else {
            array[i] = right[r];
            r++;
        }
        i++;
    }
    // fill up the rest
    while (l < left.size()) {
        array[i] = left[l];
        l++;
        i++;
    }
    while (r < right.size()) {
        array[i] = right[r];
        r++;
        i++;
    }
}


int main() {
    srand(time(0));
    // Initialize a vector
    std::vector<int> array;
    for (int i =0; i<15; i++) {
        array.push_back(rand() % 99);
        std::cout << array[i] << ", ";
    }
    // Sort
    merge_sort(array);

    // Show
    std::cout << "\n";
    for (auto value : array) {
        std::cout << value << ", ";
    }
    std::cout << "\n";
}
