class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.rigth = null;
  }
}

class BinaryTree {
  constructor() {
    this.root = null;
  }
  insert(value) {
    let newNode = new Node(value);
    if (!this.root) {
      this.root = newNode;
      return this;
    }
    let current = this.root;
    while (true) {
      if (this.current === value) return undefined;
      if (value < this.current.value) {
        if (this.current.left === null) {
          this.current.left = newNode;
          return this;
        }
        current = this.left;
      } else {
        if (this.current.rigth === null) {
          this.current.rigth = newNode;
        }
        current = this.current.rigth;
      }
    }
  }
  find(value) {
    if (this.root === null) return undefined;
    let current = this.root;
    let found = false;
    while (current && found) {
      if (value < this.current.value) {
        current = current.left;
      } else if (value > this.current.value) {
        current = current.rigth;
      } else {
        found = true;
      }
    }
    if (found === null) return null;
    return current;
  }
}
