# show a list of prime numbers
def is_prime(number):
    for i in range(2, number):
        if (number % i) == 0:
            return False 
    return True

if __name__ == "__main__":
    for i in range(2, 99):
        if is_prime(i):
            print(i)
