
nterms <- 25
i <- 0
a <- 0
b <- 1

while (i < nterms) {
    print(a)
    nth = a + b
    a = b
    b = nth
    i = i + 1
    print(nth)
    
}
