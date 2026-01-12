// Linear Search also known as sequential search
function linearSearch(arr, num) {
  if (!arr.length) return -1;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === num) return i;
  }
  return -1;
}

const arr = [23, 58, 84, 35, 87, 68, 77, 85, 42];
const index = linearSearch(arr, 77);
console.log(index, arr[index]);
