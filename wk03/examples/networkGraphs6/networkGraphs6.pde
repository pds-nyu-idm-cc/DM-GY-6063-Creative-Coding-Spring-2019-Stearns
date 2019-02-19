// in this ellaboration, we add:
// ArrayLists
// Key bindings
// mouse interactivity
// multiple constructors

String mode="WRAP";

// draw lines if shorter than
float maxDist = 50;

// declare an array of Node objects
ArrayList<Node> nodes;

void setup() {

  size(500, 500);
  frameRate(30);

  // initialize the array of Node objects
  nodes = new ArrayList<Node>();

  background(0);
}

void draw() {

  background(0);

  //draw all the lines first
  for (int i = 0; i < nodes.size(); i++) {
    for (int j = i+1; j < nodes.size(); j++) {
      Node n1 = nodes.get(i);
      Node n2 = nodes.get(j);
      // but only if the nodes are close enough
      if ( n1.distance(n2) < maxDist) {
        n1.drawLine(n2);
      }
    }
  }
  
  // shorthand ArrayList iteration
  for (Node n : nodes) {
    n.render(); 
  }
  
  for (int i = nodes.size()-1; i >=0 ; i--){
    Node n = nodes.get(i);
    n.update(mode);
    // if the node is too old, remove it
    if(n.isDead()){
      nodes.remove(i);
    }
  }
}

void mouseClicked(){
  // every click of the mouse adds a node
  nodes.add(new Node(mouseX,mouseY));
}
