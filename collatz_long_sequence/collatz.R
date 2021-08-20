

next_collatz<-function(number){
    # get the next number for the sequence
    if ((number %% 2) == 0) {
        return(number / 2)
    } else {
        return(3 * number + 1)
    }
}

collatz_sequence<-function(number){
    # Return a list of collatz numbers
    sequence = c()
    col_number = number
    while (col_number > 0){
        current = col_number
        col_number = next_collatz(current)
        sequence = append(sequence, current)
        if (current == 1) {break}
    }
    return(sequence)
}

longest_collatz_seq<-function(from){
    # find the longest collatz sequence starting from a given number
    longest_id = NULL
    longest_count = 0
    for (i in from:1){
        sequence = collatz_sequence(i)
        size = length(sequence)
        if (size > longest_count) {
            longest_id = i
            longest_count = size
        }
    }
    return(c(longest_id, longest_count))
}

# print(collatz_sequence(13))
result = longest_collatz_seq(10000)
cat("Longest collatz sequence is", result[2], "elements for", result[1], "\n")




