// back to using nodes...
// Check out the class definition for the implementation of Processing's 
// PVector class

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
