#include<iostream>
#include<vector>

int next_collatz_number(int from) {
    if (from <= 1) {
        return 1;
    }
    else if (from % 2 == 0) {
        return from / 2;
    }
    else {
        return 3 * from + 1;
    }
}

std::vector<int> get_collatz_sequence(int start) {
    int number = start;
    std::vector<int> sequence;
    while (number != 1) {
        sequence.push_back(number);
        number = next_collatz_number(number);
    }
    sequence.push_back(1);
    return sequence;
}

void find_longest_sequence(int until) {
    int longest_number;
    int longest_size = 0;
    for (int i = 1; i < until; i++) {
        std::vector<int> sequence = get_collatz_sequence(i);
        if (sequence.size() > longest_size) {
            longest_number = i;
            longest_size = sequence.size();
        }
    }
    std::cout << "Longest collatz sequence has " << longest_size;
    std::cout << " elements for " << longest_number;
}


int main() {
    find_longest_sequence(10000);
}
