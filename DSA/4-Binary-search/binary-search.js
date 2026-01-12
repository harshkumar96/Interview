// Binary Search Need Sorted Array
function binarySearch(ele, arr) {
  if (!arr.length) return -1;
  let start = 0;
  let mid;
  let end = arr.length - 1;
  while (start <= end) {
    mid = Math.floor(start + (end - start) / 2);
    if (arr[mid] === ele) {
      return mid;
    } else if (ele < arr[mid]) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }
  }
  return -1;
}

const num = 45;
const arr = [
  2, 5, 8, 19, 22, 29, 45, 54, 58, 65, 78, 79, 85, 88, 91, 94, 96, 99,
];
const index = binarySearch(arr, num);
console.log(index, num);
