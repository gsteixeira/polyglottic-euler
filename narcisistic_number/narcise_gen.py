# generates a sequence of narcisistic numbers
def narcissistic(number):
    """ tell if a number is narcisistic """
    s_number = str(number)
    digits = len(s_number)
    pow_list = []
    for dig in s_number:
        power = int(dig) ** digits
        pow_list.append(power)
    total = sum(pow_list)
    return (total == number)

for i in range(10, 100000):
    if narcissistic(i):
        print(i)
