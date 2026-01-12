function linearSearch(ele, arr) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === ele) return i;
  }
  return -1;
}
const arrm = [23, 58, 84, 35, 87, 68, 77, 85, 42];
console.log(linearSearch(2, arrm));
