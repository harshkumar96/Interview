class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

class Queue {
  constructor() {
    this.first = null;
    this.last = null;
    this.size = 0;
  }
  enqueu(val) {
    const newNode = new Node(val);

    if (this.size) {
      this.last.next = newNode;
    } else {
      this.first = newNode;
    }
    this.last = newNode;
    this.size++;
    return this;
  }
  dequeue() {
    if (!this.size) return undefined;
    const currentFirst = this.first;
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
