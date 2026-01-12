function selectionSort(arr) {
  if (!arr.length) return;
  for (let i = 0; i < arr.length - 1; i++) {
    let index = i;
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[index] > arr[j]) {
        index = j;
      }
    }
    if (i !== index) {
      const temp = arr[index];
      arr[index] = arr[i];
      arr[i] = temp;
    }
  }
  return;
}
const arr = [89, 25, 78, 98, 25, 75, 64, 48, 99, 63, 35, 33, 92, 2, 9, 19, 60];
selectionSort(arr);
console.log(arr);
