class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.first = null;
    this.last = null;
    this.size = 0;
  }
  push(val) {
    const newNode = new Node(val);
    if (this.first) {
      newNode.next = this.first;
      this.first = newNode;
    } else {
      this.first = newNode;
      this.last = newNode;
    }
    this.size++;
    return this;
  }
  pop() {
    if (!this.size) return undefined;
    let currentFirst = this.first;
    this.first = currentFirst.next;
    currentFirst.next = null;
    this.size--;
    if (!this.size) {
      this.first = null;
      this.last = null;
    }
    return currentFirst;
  }
}
