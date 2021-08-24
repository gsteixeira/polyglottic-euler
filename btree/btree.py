# Implementation of a Binary Tree in python

import random
from time import time

class Node(object):
    """ Binary Tree node object """
    value = None
    quantity = 0
    left = None
    right = None
    
    def initialize(self, number):
        """ get node btree ready """
        self.value = number
        self.quantity = 1
        self.left = Node()
        self.right = Node()
    
    def search(self, target, depth=0):
        """ return True if exists, False if doesn't """
        if target == self.value:
            return depth
        elif target < self.value and not self.left.is_empty():
            depth += 1
            return self.left.search(target, depth)
        elif not self.right.is_empty():
            depth += 1
            return self.right.search(target, depth)
        else:
            return -1
    
    def min_node(self):
        """ Find the lowest node of the tree """
        if not self.left.is_empty():
            return self.left.min_node()
        else:
            return self

    def max_node(self):
        """ Find the highest node of the tree """
        if not self.right.is_empty():
            return self.right.max_node()
        else:
            return self

    def insert(self, number):
        """ insert a number on btree """
        if self.is_empty():
            self.initialize(number)
        elif number == self.value:
            self.quantity += 1
        elif number < self.value:
            self.left.insert(number)
        else:
            self.right.insert(number)

    def is_empty(self):
        """ tell if a node is used or not """
        return self.quantity < 1

def traversal(node):
    """ in order traversal """
    if not node.is_empty():
        traversal(node.left)
        for _ in range(node.quantity):
            print(node.value)
        traversal(node.right)

def traversal_inplace(node):
    """ in place traversal """
    if not node.is_empty():
        for _ in range(node.quantity):
            print(node.value)
        traversal_inplace(node.left)
        traversal_inplace(node.right)

def traversal_postorder(node):
    """ post order traversal """
    if not node.is_empty():
        traversal_postorder(node.left)
        traversal_postorder(node.right)
        for _ in range(node.quantity):
            print(node.value)


if __name__ == "__main__":
    # input parameters
    items_qty = 20
    values_upto = 20
    # get a random list
    the_list = [random.randint(0,values_upto) for _ in range(items_qty)]
    # insert values
    btree = Node()
    for num in the_list:
        btree.insert(num)
    # some tests
    assert btree.search(random.choice(the_list)) >= 0
    assert btree.search(values_upto + 100) < 0
    assert btree.min_node().value == min(the_list)
    assert btree.max_node().value == max(the_list)
    print('Transversal InOrder')
    traversal(btree)
    #print('InPlace')
    #traversal_inplace(btree)
    #print('PostOrder')
    #traversal_postorder(btree)
    target = random.choice(the_list)
    found = btree.search(target)
    if (found > -1):
        print("We found {}! It took {} steps to find it.".format(target, found))
