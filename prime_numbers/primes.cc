#include<iostream>

bool is_prime(int number) {
    for (int i = 2; i < number; i++) {
        if (number % i == 0) return false;
    }
    return true;
}

int main () {
    for (int i = 0; i < 99; i++) {
        if (is_prime(i)) {
            std::cout << i << ", ";
        }
    }
}
