#include<algorithm>
#include<iostream>
#include<math.h>
#include<vector>


/* break up a number into a vector of it's digits */
void decompose_number(int number, std::vector<int>& digits) {
    while (number > 0) {
        int remainder = number % 10;
        number = (int)(number / 10);
        digits.insert(digits.begin(), remainder);
    }
}

/* break up a number into a vector of it's digits */
bool is_narcisistic(int number) {
    int sum_pow = 0;
    std::vector<int> digits;
    decompose_number(number, digits);

    for (int d : digits) {
        int power = pow(d, digits.size());
        sum_pow += power;
    }
    return (sum_pow == number);
}

/* generate a sequence of narcisisistic numbers*/
int main() {
    for(int i = 10; i< 10000; i++) {
        if (is_narcisistic(i)) {
            std::cout << i << "\n";
        }
    }
}
