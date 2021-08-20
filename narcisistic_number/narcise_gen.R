
narcisistic <- function (number) {
    s_number = as.character(number)
    str_vector <- unlist(strsplit(s_number, ""))
    digits = length(str_vector)
    pow_list = c()
    for (char in str_vector) {
        dig <- as.integer(char)
        power <- dig ** digits
        pow_list = append(pow_list, power)
    }
    total = sum(pow_list)
    return(total == number)
}

for (i in 10:100000) {
    if (narcisistic(i)) {
        cat(i, '\n')
    }
}
