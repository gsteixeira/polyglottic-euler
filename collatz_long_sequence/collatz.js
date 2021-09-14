// Find the longest Collatz sequence

// Count recursively the items in the collatz sequence
function collatz_counter(number) {
    if (number == 1) {
        return 1;
    } else if ((number % 2) == 0) {
        return 1 + collatz_counter(number/2);
    } else {
        return 1 + collatz_counter(3 * number + 1);
    }
}

// Find the longest collatz sequence for every number up to "upto"
function get_longest_collatz(upto) {
    var longest_id;
    var longest_count = 0;
    var count;
    for (var i=2; i<=upto; i++) {
        count = collatz_counter(i)
        if (count > longest_count) {
            longest_id = i;
            longest_count = count;
        }
    }
    console.log("The longest collatz sequence has " + longest_count + " elements for " + longest_id);
}

get_longest_collatz(1000);

