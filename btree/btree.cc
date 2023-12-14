#include<iostream>


class BTreeNode {
public:
    int value = 0;
    int quantity = 0;
    BTreeNode* left = NULL;
    BTreeNode* right = NULL;

    BTreeNode();
    ~BTreeNode();

    void initialize(int value);
    bool is_empty();
    int search(int value);
    void insert(int value);
};


BTreeNode::BTreeNode() {
    quantity = 0;
}

BTreeNode::~BTreeNode() {
    delete left;
    delete right;
}

void BTreeNode::initialize(int p_value) {
    value = p_value;
    quantity = 1;
    left = new BTreeNode();
    right = new BTreeNode();
}

bool BTreeNode::is_empty() {
    return quantity < 1;
}

void BTreeNode::insert(int number) {
    if (is_empty()) {
        initialize(number);
    }
    else if (value == number) {
        quantity++;
    }
    else if (number < value) {
        left->insert(number);
    }
    else {
        right->insert(number);
    }
}

int BTreeNode::search(int number) {
    if (is_empty()) {
        return 0;
    }
    else if (value == number) {
        return quantity;
    }
    else if (number < value) {
        return left->search(number);
    }
    else {
        return right->search(number);
    }
}


void transversal(BTreeNode* node) {
    if (!node->is_empty()) {
        transversal(node->left);
        for (int i = 0; i < node->quantity; i++) {
            std::cout << node->value << ", ";
        }
        transversal(node->right);
    }
}


int main() {
    BTreeNode btree = BTreeNode();
    srand(time(0));

    for (int i =0; i<15; i++) {
        int v = rand() % 99;
        btree.insert(v);
        std::cout << v << ", ";
    }

    std::cout << "\n";
    transversal(&btree);
    std::cout << "\n";
}
