""" Selection sort
"""
from random import randint

def selection_sort(array:list):
    """ Sort an array using Selection Sort """
    size = len(array)
    for i in range(size):
        min_val, min_idx = array[i], None
        for k in range(i+1, size):
            if array[k] < min_val:
                min_val, min_idx = array[k], k
        if min_val < array[i]:
            array[i], array[min_idx] = array[min_idx], array[i]

if __name__ == "__main__":
    nterms = 10
    a = [randint(0, 99) for _ in range(nterms)]
    print(a)
    selection_sort(a)
    print(a)
    
    
