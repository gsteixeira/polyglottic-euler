""" Decompose a number into a list of its digits
"""

def decompose_integer(number):
    """ decompose and integer returning a list of digits
    """
    elements = []
    number = int(number)
    while (number > 0):
        remainder = number % 10
        number //= 10
        elements.insert(0, remainder)
    return elements


def integer_decomposer(number):
    """ generator that decompose and integer yielding a list of digits
    """
    number = int(number)
    while (number > 0):
        remainder = number % 10
        number //= 10
        yield remainder


if __name__ == "__main__":
    elms = decompose_integer(12345)
    print("the array ", elms)
    
    for x in decompose_integer(4567):
        print(x)
    
    for x in decompose_integer(123.4):
        print(x)
    
