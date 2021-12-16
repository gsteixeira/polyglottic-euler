""" Quick Sort
"""
import random

def quicksort(array:list):
    """ Sort array using the Quick Sort algorithm """
    if not array:
        return array
    idx = random.randint(0, len(array)-1)
    center = [x for x in array if x == array[idx]]
    left = [x for x in array if x < array[idx]]
    right = [x for x in array if x > array[idx]]
    return quicksort(left) + center + quicksort(right)

if __name__ == "__main__":
    arr = [random.randint(0, 99) for _ in range(15)]
    print(arr)
    result = quicksort(arr)
    print(result)
