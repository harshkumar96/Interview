function merge(arr1, arr2) {
  const results = [];
  let i = 0;
  let j = 0;
  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      results.push(arr1[i]);
      i = i + 1;
    } else {
      results.push(arr2[j]);
      j = j + 1;
    }
  }
  while (i < arr1.length) {
    results.push(arr1[i]);
    i = i + 1;
  }
  while (j < arr2.length) {
    results.push(arr2[j]);
    j = j + 1;
  }
  return results;
}

function mergeSort(arr) {
  if (arr.length <= 1) return arr;
  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);
  const arr1 = mergeSort(left);
  const arr2 = mergeSort(right);
  return merge(arr1, arr2);
}
const arr = [10, 24, 76, 73];
const newMerge = mergeSort(arr);
console.log(newMerge);
