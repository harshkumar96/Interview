// In bubble sort multiple passes gone on and in each max number is set at end
function bubbleSort(arr) {
  if (!arr.length) return;
  const len = arr.length;
  for (let i = 0; i < len - 1; i++) {
    let swap = false;
    for (j = 0; j < len - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        let temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        swap = true;
      }
    }
    if (swap === false) break;
  }
}

const arr = [89, 25, 78, 98, 25, 75, 64, 48, 99, 63, 35, 33, 92, 2, 9, 19, 60];
bubbleSort(arr);
console.log(arr);
