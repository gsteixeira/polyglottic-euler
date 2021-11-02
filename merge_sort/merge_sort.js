



// Merge sort function. Sort the given array.
// :param arr Array(): the array to be sorted
function merge_sort(arr) {
    if (arr.length > 1) {
        var half = Math.floor(arr.length / 2);
        var left = arr.slice(0, half);
        var right = arr.slice(half, arr.length);
        merge_sort(left);
        merge_sort(right);
        var i = 0;
        var j = 0;
        var k = 0;
        // merge back again
        while (i < left.length && j < right.length) {
            if (left[i] < right[j]) {
                arr[k] = left[i];
                i++;
            } else {
                arr[k] = right[j];
                j++;
            }
            k++;
        }
        // finish
        while (i < left.length) {
            arr[k] = left[i];
            i++;
            k++;
        }
        while (j < right.length) {
            arr[k] = right[j];
            j++;
            k++;
        }
    }
}



var a = [9, 7, 8, 6, 5, 3, 4, 1, 2];

console.log(a);
merge_sort(a);
console.log(a);
