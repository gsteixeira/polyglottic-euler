""" Merge sort in python.
"""

def merge_sort(array: list):
    """
    Merge sort function. Sort the given array.
        :param array list: the array to be sorted
    """
    size = len(array)
    if size > 1:
        # divide in two
        middle = size // 2
        left = array[0:middle]
        right = array[middle:]
        # call recursively
        merge_sort(left)
        merge_sort(right)
        # Join it back
        i = j = k = 0
        while (i < len(left) and j < len(right)):
            if left[i] < right[j]:
                array[k] = left[i]
                i += 1
            else:
                array[k] = right[j]
                j += 1
            k += 1
        # copy remaining elements if any...
        while i < len(left):
            array[k] = left[i]
            i += 1
            k += 1
        # ..from both arrays.
        while j < len(right):
            array[k] = right[j]
            j += 1
            k += 1

if __name__ == "__main__":
    a = [ 5, 6, 3, 8, 1, 9, 2 ]
    print(a)
    merge_sort(a)
    print(a)
