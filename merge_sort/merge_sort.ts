


function merge_sort(arr: number[]) {
    if (arr.length > 1) {
        // split the array in two
        let half :number = Math.floor(arr.length / 2);
        let left :number[] = arr.slice(0, half);
        let right :number[] = arr.slice(half, arr.length);
        // call recursivelly
        merge_sort(left);
        merge_sort(right);
        // join it back, orderly
        var i, j, k :number = 0;
        i = 0;
        j = 0;
        k = 0;
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


var arr :number[] = [];
let i :number;
for (i=0; i<10; i++) {
    arr[i] = Math.floor(Math.random() * 99);
}
console.log(arr);
merge_sort(arr);
console.log(arr);
