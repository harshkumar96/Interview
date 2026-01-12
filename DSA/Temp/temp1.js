function Dijkstra(start, finish) {
  const node = new PriorityQueue();
  const distance = {};
  const previous = {};
  const path = [];
  let smallest;
  for (let vertex in this.adjacencyList) {
    if (vertex === start) {
      distance[vertex] = 0;
      node.enqueue(vertex, 0);
    } else {
      distance[vertex] = Infinity;
      node.enqueue(vertex, Infinity);
    }
    previous[vertex] = null;
  }
  while (node.values.length) {
    smallest = node.dequeue().value;
    if (smallest === finish) {
      while (previous[smallest]) {
        path.push(smallest);
        smallest = previous[smallest];
      }
    }
    break;
  }
  if (smallest || distance[smallest] !== Infinity) {
    for (neighbor in this.adjacencyList[smallest]) {
      let nextNode = this.adjacencyList[smallest][neighbor];
      
    }
  }
  return path;
}
