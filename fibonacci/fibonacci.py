""" Generates a fibonacci sequence
This implementation shows how to do it with a normal function and a generator.
"""
def fibo_generator(upto):
    """ a generator that creates a fibonacci sequence
    """
    n1 = 0
    n2 = 1
    for idx in range(1, upto):
        yield n1
        nth = n1 + n2
        n1 = n2
        n2 = nth

def print_fibo(upto):
    """ This function shows the sequence on screen 
    """
    n1 = 0
    n2 = 1
    for idx in range(1, upto):
        print(n1)
        nth = n1 + n2
        n1 = n2
        n2 = nth

if __name__ == "__main__":
    for x in fibo_generator(25):
        print(x)
    #print_fibo(99)
    
