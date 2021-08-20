""" Find the longest Collatz sequence
The python implementation is longer because it implements two ways to get to
the numbers, and play around with possibilities.
One is returning the whole list. Then we get it's length.
Other is using recursion to get only the size.
It also tryies to use memoization using a decorator.
Using recursion is much more faster.
"""

def memo(function):
    """ decorator to memoize the recursive function.
    Caches the result of known numbers.
    """
    memory = {}
    def wrapper(*args, **kwargs):
        if args[0] in memory.keys():
            return memory[args[0]]
        result = function(*args, **kwargs)
        memory[args[0]] = result
        return result
    return wrapper

@memo
def collatz_recursive(number):
    """ Do collatz function recursively
    This function won't generate the sequence, giving only the size instead
    """
    if number == 1:
        return 1
    elif ((number % 2) == 0):
        return 1 + collatz_recursive(number / 2)
    else:
        return 1 + collatz_recursive(3 * number + 1)

def next_collatz(number):
    """ get the next element of sequence
    """
    if ((number % 2) == 0):
        return int(number / 2)
    else:
        return 3 * number + 1


def collatz_generator(start):
    """ generator that produces a collatz sequence
    """
    col_number = start
    while (col_number > 0):
        current = col_number
        col_number = next_collatz(current)
        yield current
        if current == 1:
            break

def collatz_sequence(number):
    """ Return a list of collatz numbers
    """
    sequence = []
    col_number = number
    while (col_number > 0):
        current = col_number
        col_number = next_collatz(current)
        sequence.append(current)
        if current == 1:
            break
    return sequence

def longest_collatz_sequence(begin_at):
    """ Find the longest Collatz Sequence in all the numbers starting at..
    """
    larger_id = None
    larger_seq = 0
    for i in range(begin_at, 0, -1):
        sequence = collatz_sequence(i)
        seq_count = len(sequence)
        if seq_count > larger_seq:
            larger_id = i
            larger_seq = seq_count
    return (larger_id, larger_seq)


def longest_collatz_sequence_recursive(begin_at):
    """ Find the longest Collatz Sequence in all the numbers starting at..
    """
    larger_id = None
    larger_seq = 0
    for i in range(begin_at, 0, -1):
        seq_count = collatz_recursive(i)
        if seq_count > larger_seq:
            larger_id = i
            larger_seq = seq_count
    return (larger_id, larger_seq)

if __name__ == "__main__":
    #print("the longest_collat_sequence is", longest_collatz_sequence(100000))
    element, count = longest_collatz_sequence_recursive(10000)
    print("The longest collatz sequence has "
          "{} elements for {}".format(element, count))
    #We can use a generator
    #for x in collatz_generator(13):
        #print(x)


    
