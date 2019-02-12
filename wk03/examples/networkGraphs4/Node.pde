// a class defines and object with its own fields and methods
// fields are variables that belong to the object
// methods are functions that belong to the object
// the scope of the fields and methods is confined to the instance of that object
// objects are instantiated similar to declaring a variable

// in our Node class, we define an object that has all the fields we were previously using arrays to hold 
class Node {
  // fields
  float x; // location
  float y;
  float sX; // speed
  float sY;
  color fC; // fill color
  color sC; // stroke color

  // constructors

  // when you create an instance of an object, you call Class Object = new Class()
  // the arguments supplied to Class() must have a matching constructor
  // the constructor below is for creating a Node object without arguments

  Node() {
    x = random(width);
    y = random(height);
    sX = random(-2.5, 2.5);
    sY = random(-2.5, 2.5);
    fC = color(random(256), random(256), random(256));
    sC = color(255);
  }

  // methods

  void update() {
    x+=sX;
    y+=sY;
    bounce();
  }
  
  void bounce(){
  // effectively detects collision with canvas edge
    // reverses the direction and speed
    if (x < 0 && sX < 0) {
      sX*=-1;
      x=0;
    } else if (x > width && sX > 0) {
      sX*=-1;
      x=width;
    }

    if (y < 0  && sY < 0) {
      sY*=-1;
      y=0;
    } else if (y > height  && sY > 0) {
      sY*=-1;
      y=height;
    }
  }

  // draw the node
  void render() {
    stroke(sC);
    strokeWeight(5);
    point(x, y);
  }
  
  // draw the lines
  void drawLine(Node _n) {
    stroke(127);
    strokeWeight(0.5);
    // created a distance() function to return the distance between two points
    // this function now accepts Node objects as arguments
    // note that accessing fields is done using . as in Object.field
    line(x, y, _n.x, _n.y);
  }

  float distance(Node _n) {
    // distance calculated as the hypotenuse formed 
    return pow( pow( _n.x - x, 2) + pow( _n.y - y, 2), 0.5);
  }
}
