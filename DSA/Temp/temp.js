
function merge(left, right) {
    let leftIndex = 0;
    let rightIndex = 0;
    const result = []
    while (leftIndex < left.length && rightIndex < right.length) {
        if (left[leftIndex] < right[rightIndex]) {
            result.push(left[leftIndex]);
            leftIndex++;
        } else {
            result.push(right[rightIndex]);
            rightIndex++;
        }
    }
    return result.concat(left.slice(leftIndex)).concat(right.slice(rightIndex))
}

function mergeSort(arr) {
    if (arr.length <= 1) return arr
    const midIndex = Math.floor(arr.length / 2);
    const left = mergeSort(arr.slice(0, midIndex));
    const right = mergeSort(arr.slice(midIndex))
    return merge(left, right);
}



// Quick Sort

function quickSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }
    const pivot = arr[arr.length - 1];
    const left = [];
    const right = [];
    for (let i = 0; i < arr.length - 1; i++) {
        if (arr[i] < pivot) {
            left.push(arr[i])
        } else {
            right.push(arr[i])
        }
    }
    return [...quickSort(left), pivot, ...quickSort(right)]
}


// redix Sort
function findMax(arr) {
    let max = arr[0];
    for (let i = 1; i < arr.length; i++) {
        if (max < arr[i]) max = arr[i]
    }
    return max;
}

function countSort(sortedArray, exp) {
    const output = Array(sortedArray.length)
    const count = Array(10).fill(0, 0);
    for (const sortedElement of sortedArray) {
        const digit = Math.floor(sortedElement / exp) % 10;
        count[digit]++;
    }
    for (let i = 1; i < count.length; i++) {
        count[i] += count[i - 1]
    }
    for (let i = sortedArray.length - 1; i >= 0; i--) {
        const digit = Math.floor(sortedArray[i] / exp) % 10;
        output[count[digit] - 1] = sortedArray[i];
        count[digit]--;
    }
    return output
}


function radixSort(arr) {
    const max = findMax(arr);
    let sortedArray = [...arr]
    for (let exp = 1; Math.floor(max / exp) > 0; exp *= 10) {
        const sortIterated = countSort(sortedArray, exp)
        sortedArray = sortIterated;
    }
    return sortedArray;
}