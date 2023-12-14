#include<iostream>

int main() {
    int a = 0;
    int b = 1;
    int nth;
    for (int i = 0; i< 25; i++) {
        std::cout << a << ", ";
        nth = a + b;
        a = b;
        b = nth;
    }
}
