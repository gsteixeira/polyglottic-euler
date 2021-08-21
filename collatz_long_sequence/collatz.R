
next_collatz<-function(number){
    # get the next collatz number
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

# alternative solution:
#   recursive, count only, memoize method
#   slower, but tried to use memoization to speed it up.
cache <- data.frame(root=c(), counter=c())

recursive_count_seq<-function(number){
    # recursively count how much itens there are in collatz sequence
    # But before that, we check if we haven't already calculated this number bf
    # If yes, return it right away.
    idx <- which(cache$root == number)
    if (length(idx) > 0) {
        counter = cache$counter[idx]
        # cat("i have it", idx, counter, '\n')
        return(counter)
    }
    if (number == 1) {
        counter = number
    } else if ((number %% 2) == 0) {
        counter = 1 + recursive_count_seq(number / 2)
    } else {
        counter = 1 + recursive_count_seq(3 * number + 1)
    }
    keep <- data.frame(root=number, counter=counter)
    # comment the next line to test the difference on performance
    # 3m30.590s vs 0m15.765s!! for 10000
    .GlobalEnv$cache <- rbind(cache, keep)
    return(counter)
}


recursive_longest_collatz_seq<-function(from){
    # find the longest collatz sequence starting from a given number
    longest_id = NULL
    longest_count = 0
    for (i in from:1){
        size = recursive_count_seq(i)
        if (size > longest_count) {
            longest_id = i
            longest_count = size
        }
    }
    return(c(longest_id, longest_count))
}


# print(collatz_sequence(13))
start <- Sys.time()
result = longest_collatz_seq(10000)
end <- Sys.time()
elapsed = end - start
cat("Longest collatz sequence is ", result[2], "elements for", result[1], "\n")
print(elapsed)

start <- Sys.time()
result = recursive_longest_collatz_seq(10000)
end <- Sys.time()
elapsed = end - start
cat("Longest collatz sequence is ", result[2], "elements for", result[1], "\n")
print(elapsed)
print(summary(cache))

# with recursion vs without it
# # without          2.45 secs !!!
# # with recursion  15.16 secs
