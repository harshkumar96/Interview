// It is a multiple pass process in which after each pass min element set at initial position
function selectionSort(arr) {
  const len = arr.length;
  if (!len) return;
  for (let i = 0; i < len - 1; i++) {
    let min_index = i;
    for (let j = i + 1; j < len; j++) {
      if (arr[min_index] > arr[j]) {
        min_index = j;
      }
    }
    if (i !== min_index) {
      let temp = arr[min_index];
      arr[min_index] = arr[i];
      arr[i] = temp;
    }
  }
}

const arr = [89, 25, 78, 98, 25, 75, 64, 48, 99, 63, 35, 33, 92, 2, 9, 19, 60];
selectionSort(arr);
console.log(arr);
