ArrayList<Node> nodes; //create the arraylist to store the node objects
int difference=50; // distances of nodes

void setup() // iterate the nodes into the arraylist
{
  size(800,500);
  smooth();
  nodes = new ArrayList<Node>();
  for (int i=0;i<100;i++)
  {
    Node D = new Node();
    nodes.add(D); // add node objects into the arraylist for drawing
  }
}

void draw() // draw the nodes by loopping them out of the arraylist and create the shapes
{
  background(255,255,255);
  for (int i=0;i<nodes.size();i++)
  {
    Node D1 = (Node) nodes.get(i); // get the first node object.
    D1.display(); //call functions from node class
    D1.update();
    D1.mouseMove();
    for (int j = i + 1; j < nodes.size(); j++) {
      Node D2 = (Node) nodes.get(j);
      D2.update();
      if (dist(D1.position.x, D1.position.y, D2.position.x, D2.position.y)< difference)
      {
        for (int k = j + 1; k < nodes.size(); k++) {
          Node D3 = (Node) nodes.get(k);
          if (dist(D2.position.x, D2.position.y, D3.position.x, D3.position.y)< difference){
            for (int n = k + 1; n < nodes.size(); n++) {
              Node D4 = (Node) nodes.get(n);
              if (dist(D3.position.x, D3.position.y, D4.position.x, D4.position.y)< difference) {
                stroke(255, 10);
                fill(D4.c, 100);
                
              //switch(nodes.size()){
              //  case 0:
              //    break;
                  
              //  case 1:
              //    beginShape(POINTS);
              //    vertex(D1.position.x, D1.position.y);
              //    vertex(D2.position.x, D2.position.y);
              //    vertex(D3.position.x, D3.position.y);
              //    vertex(D4.position.x, D4.position.y);
              //    endShape();
                  
              //  case 2:
              //    beginShape(LINES);
              //    vertex(D1.position.x, D1.position.y);
              //    vertex(D2.position.x, D2.position.y);
              //    vertex(D3.position.x, D3.position.y);
              //    vertex(D4.position.x, D4.position.y);
              //    endShape();
                
              //  case 3:
              //    beginShape(LINES);
              //    vertex(D1.position.x, D1.position.y);
              //    vertex(D2.position.x, D2.position.y);
              //    vertex(D3.position.x, D3.position.y);
              //    //vertex(D4.position.x, D4.position.y);
              //    endShape();
                
              //  case 4:
              //   beginShape();
              //   vertex(D1.position.x, D1.position.y);
              //   vertex(D2.position.x, D2.position.y);
              //   vertex(D3.position.x, D3.position.y);
              //   vertex(D4.position.x, D4.position.y);
              //   endShape();
              //}
              beginShape();
              vertex(D1.position.x, D1.position.y);
              vertex(D2.position.x, D2.position.y);
              vertex(D3.position.x, D3.position.y);
              vertex(D4.position.x, D4.position.y);
              endShape();
          }
          D4.update();
            }
          }
        }
      }
    }
  }
}
 
