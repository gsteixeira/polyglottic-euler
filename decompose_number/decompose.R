# decompose a number into an array of it's digits

decompose_integer<-function(number){
    elements = c()
    number = abs(as.integer(number))
    while (number > 0) {
        remainder = number %% 10
        number = floor(number / 10)
        elements = append(elements, remainder, after=0)
    }
    return(elements)
}

elements = decompose_integer(12345)
cat("the array", elements, '\n')
for (elm in elements) {
    print(elm)
}
