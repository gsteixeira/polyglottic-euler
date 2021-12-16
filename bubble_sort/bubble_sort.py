""" Bubble Sort in Python
"""
from random import randint

def bubble_sort(array:list):
    """ Sort array using Bubble Sort technique """
    size = len(array)
    for i in range(size):
        swaped = False
        for j in range(size - i - 1):
            if array[j+1] < array[j]:
                array[j], array[j+1] = array[j+1], array[j]
                swaped = True
        if not swaped:
            break

if __name__ == "__main__":
    arr = [randint(0, 99) for _ in range(10)]
    print(arr)
    bubble_sort(arr)
    print(arr)
