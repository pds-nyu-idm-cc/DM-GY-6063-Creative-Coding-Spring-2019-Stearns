// Expands on previous example by introducing classes
// Instead of having a bunch of arrays that hold the features of  a "Node",
// We define a class describes a group of objects.
// In this case, our class Node dscribes a group of Node objects.

// draw lots of nodes
int qtyNodes = 250;
// draw lines if shorter than
float maxDist = 50;

// declare an array of Node objects
Node[] nodes;

void setup() {

  size(500, 500);
  frameRate(30);

  // initialize the array of Node objects
  nodes = new Node[qtyNodes];

  // create instances of Node objects
  for (int i = 0; i < qtyNodes; i++) {
    nodes[i]= new Node();
  }

  background(0);
}

void draw() {

  background(0);

  //draw all the lines first
  for (int i = 0; i < qtyNodes; i++) {
    for (int j = i+1; j < qtyNodes; j++) {
      // but only if the nodes are close enough
      if ( nodes[i].distance(nodes[j]) < maxDist) {
        nodes[i].drawLine(nodes[j]);
      }
    }
  }

  for (int i = 0; i < qtyNodes; i++) {
    nodes[i].render();
    nodes[i].update();
  }
}
