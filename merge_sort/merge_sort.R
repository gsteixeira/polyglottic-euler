## A Merge Sort implementation in R

# the Merge sort function
# :param arr c(): the array
merge_sort <- function(arr) {
    size <- length(arr)
    if (size > 1) {
        # divide in two
        half = floor(size / 2)
        left <- arr[0:half]
        right <- arr[-(0:half)]
        # call recursively
        left <- merge_sort(left)
        right <- merge_sort(right)
        # join it back
        i = j = k = 1
        while (i <= length(left) && j <= length(right)) {
            if (left[i] < right[j]) {
                arr[k] <- left[i]
                i <- i + 1
            } else {
                arr[k] <- right[j]
                j <- j + 1
            }
            k <- k + 1
        }
        # finish
        while (i <= length(left)) {
            arr[k] <- left[i]
            i <- i + 1
            k <- k + 1
        }
        while (j <= length(right)) {
            arr[k] <- right[j]
            j <- j + 1
            k <- k + 1
        }
    }
    return(arr)
}


# Main program
arr <- sample(15)
print(arr)
result <- merge_sort(arr)
print(result)
