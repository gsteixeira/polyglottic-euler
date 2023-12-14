#include<iostream>
#include<vector>
#include<algorithm>

std::vector<int> decompose_number(int number) {
    int remainder;
    std::vector<int> digits;
    while (number > 0) {
        remainder = number % 10;
        number = (int)(number / 10);
        digits.insert(digits.begin(), remainder);
    }
    return digits;
}


int main() {
    int input = 123400;
    std::vector<int> digits = decompose_number(input);

    for (int digit : digits) {
        std::cout << digit << "\n";
    }
}
