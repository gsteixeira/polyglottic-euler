""" Insertion Sort in Python
"""
import random

def insertion_sort(array:list):
    """ Order array using the Insertion Sort method """
    for i in range(len(array)):
        swaped = False
        for j in range(len(array)-1, i, -1):
            if array[j] < array[j-1]:
                array[j-1], array[j] = array[j], array[j-1]
                swaped = True
        if not swaped:
            break

if __name__ == "__main__":
    arr  = [random.randint(1, 99) for _ in range(12)]
    print(arr)
    insertion_sort(arr)
    print(arr)
