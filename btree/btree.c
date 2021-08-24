// A Binary tree implemented in C

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// The Binary Tree node object
struct BtNode {
    int value;
    int quantity;
    struct BtNode *left;
    struct BtNode *right;
} BtNode_default = {0, 0, NULL, NULL};

typedef struct  BtNode BtNode;

int initialize(BtNode*, int);
int search(BtNode*, int, int);
void insert(BtNode*, int);
void transversal(BtNode*);
void transversal_inplace(BtNode*);
void traversal_postorder(BtNode*);

// Insert random numbers to a Binary Tree and display them in order
int main() {
    int number, i, target, found;
    BtNode btree = { 0, 0, NULL, NULL };
    // input args
    int items_qty, values_upto;
    items_qty = 20;
    values_upto = 20;
    srand(time(NULL));
    // insert random numbers into tree
    for (i=0; i<items_qty; i++) {
        number = rand() % values_upto + 1;
        insert(&btree, number);
    }
    // Display tree in order
    transversal(&btree);
    // Search for random value
    target = rand() % values_upto + 1;
    found = search(&btree, target, 0);
    if (found >= 0) {
        printf("We found %d! It took %d steps to find it.\n", target, found);
    } else {
        printf("The target %d was not found.\n", target);
    }
}

// Get BtNode ready to use
int initialize(BtNode *node, int value) {
    node->value = value;
    node->quantity = 1;
    node->left = malloc(sizeof(BtNode));
    node->right = malloc(sizeof(BtNode));
    return 0;
}

// Insert a new item on the tree
void insert(BtNode *node, int number) {
    if (node->quantity < 1){
        initialize(node, number);
    } else if (number == node->value) {
        node->quantity++;
    } else if (number < node->value) {
        insert(node->left, number);
    } else {   
        insert(node->right, number);
    }
}

// Search for first occurrence of target in tree, 
// returns how many steps it took to find it, return -1 if cant find none
int search(BtNode *node, int target, int depth) {
    if (target == node->value) {
        return depth;
    } else if (target < node->value && node->left->quantity > 0) {
        depth++;
        return search(node->left, target, depth);
    } else if (node->quantity > 0) {
        depth++;
        return search(node->right, target, depth);
    } else {
        return -1;
    }
}

// Check if node is empty
int is_empty(BtNode *node) {
    if (node->quantity < 1) {
        return 1;
    } else { 
        return 0;
    }
}

// Prints all the values on the tree in order
void transversal(BtNode *node) {
    int i;
    if (node->quantity > 0) {
        transversal(node->left);
        for (i=0; i<node->quantity; i++) {
            printf("%d\n", node->value);
        }
        transversal(node->right);
    }
}

// Prints all the values InPlace Transversal
void transversal_inplace(BtNode *node) {
    int i;
    if (node->quantity > 0) {
        for (i=0; i<node->quantity; i++) {
            printf("%d\n", node->value);
        }
        transversal(node->left);
        transversal(node->right);
    }
}

// Prints all the values PostOrder Transversal
void traversal_postorder(BtNode *node) {
    int i;
    if (node->quantity > 0) {
        transversal(node->left);
        transversal(node->right);
        for (i=0; i<node->quantity; i++) {
            printf("%d\n", node->value);
        }
    }
}

