const crypto = require('crypto');

class ConsistentHash {
  constructor(nodes = [], virtualNodes = 100) {
    this.virtualNodes = virtualNodes;
    this.ring = new Map();
    this.sortedKeys = [];

    nodes.forEach(node => this.addNode(node));
  }

  // Generate a numeric hash for a string
  _hash(key) {
    return crypto.createHash('md5').update(key).digest('hex');
  }

  addNode(node) {
    for (let i = 0; i < this.virtualNodes; i++) {
      const virtualKey = this._hash(`${node}:${i}`);
      this.ring.set(virtualKey, node);
      this.sortedKeys.push(virtualKey);
    }
    this.sortedKeys.sort();
  }

  removeNode(node) {
    for (let i = 0; i < this.virtualNodes; i++) {
      const virtualKey = this._hash(`${node}:${i}`);
      this.ring.delete(virtualKey);
    }
    this.sortedKeys = this.sortedKeys.filter(k => this.ring.has(k));
  }

  getNode(key) {
    if (this.ring.size === 0) return null;

    const hash = this._hash(key);
    const pos = this._binarySearch(hash);
    
    // If search wraps around, return the first node (clockwise)
    const ringKey = this.sortedKeys[pos] || this.sortedKeys[0];
    return this.ring.get(ringKey);
  }

  _binarySearch(key) {
    let low = 0;
    let high = this.sortedKeys.length - 1;

    while (low <= high) {
      const mid = Math.floor((low + high) / 2);
      if (this.sortedKeys[mid] < key) low = mid + 1;
      else if (this.sortedKeys[mid] > key) high = mid - 1;
      else return mid;
    }
    return low;
  }
  _printRing() {
    console.log('Consistent Hash Ring:');
    this.sortedKeys.forEach(key => {
      console.log(`${key} -> ${this.ring.get(key)}`);
    });}
}



const cluster = new ConsistentHash(['Server_A', 'Server_B', 'Server_C']);

const users = ['user_123', 'user_456', 'user_789', 'user_abc'];

users.forEach(user => {
  console.log(`${user} is mapped to: ${cluster.getNode(user)}`);
});

// Adding a new server - only a few keys will move!
console.log('\n--- Adding Server_D ---');
cluster.addNode('Server_D');

users.forEach(user => {
  console.log(`${user} is now mapped to: ${cluster.getNode(user)}`);
});
cluster._printRing();