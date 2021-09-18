// Find the longest Collatz sequence in typescript

// Count recursively the items in the collatz sequence
function collatz_counter(value:number):number {
    if (value == 1) {
        return 1;
    } else if ((value % 2) == 0) {
        return 1 + collatz_counter(value/2);
    } else {
        return 1 + collatz_counter(3 * value + 1);
    }
}

// Find the longest collatz sequence for every number up to "upto"
function get_longest_collatz(upto) {
    var longest_id:number;
    var longest_count:number = 0;
    var count:number;
    var i:number;
    for (i=2; i<=upto; i++) {
        count = collatz_counter(i)
        if (count > longest_count) {
            longest_id = i;
            longest_count = count;
        }
    }
    console.log("The longest collatz sequence has " + longest_count + " elements for " + longest_id);
}

get_longest_collatz(10000);
