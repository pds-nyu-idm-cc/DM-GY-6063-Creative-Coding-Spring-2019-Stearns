// a class defines and object with its own fields and methods
// fields are variables that belong to the object
// methods are functions that belong to the object
// the scope of the fields and methods is confined to the instance of that object
// objects are instantiated similar to declaring a variable

// in our Node class, we define an object that has all the fields we were previously using arrays to hold 
class Node {
  // fields

  // PVectors are awesome more on this later
  PVector pos;
  PVector vel;
  color fC; // fill color
  color sC; // stroke color
  float age=0;
  float lifespan=300;

  // constructors

  // when you create an instance of an object, you call Class Object = new Class()
  // the arguments supplied to Class() must have a matching constructor
  // the constructor below is for creating a Node object without arguments

  Node() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-2.5, 2.5), random(-2.5, 2.5));
    fC = color(random(256), random(256), random(256));
    sC = color(255);
  }

  Node(float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(random(-2.5, 2.5), random(-2.5, 2.5));
    fC = color(random(256), random(256), random(256));
    sC = color(255);
  }
  
  // methods

  void update(String mode) {
    pos.add(vel);
    //age the node
    age++;
    //fade color as it ages
    sC=color(255*(1-(age/lifespan)));
    //deal with the edges
    edgeHandler(mode);
  }


  void edgeHandler( String mode) {
    switch(mode) {

    case "BOUNCE":
      bounce();
      break;

    case "WRAP":
      wrap();
      break;

    default:
      println("Unrecognized mode! Must be BOUNCE or WRAP");
      break;
    }
  }

  void wrap() {
    // wraps node around canvas
    pos.x=(pos.x+width)%width;
    pos.y=(pos.y+height)%height;
  }

  void bounce() {
    // detects collision with canvas edge
    // reverses the direction and speed
    if (pos.x < 0 && vel.x < 0) {
      vel.x*=-1;
      pos.x=0;
    } else if (pos.x > width && vel.x > 0) {
      vel.x*=-1;
      pos.x=width;
    }

    if (pos.y < 0  && vel.y < 0) {
      vel.y*=-1;
      pos.y=0;
    } else if (pos.y > height  && vel.y > 0) {
      vel.y*=-1;
      pos.y=height;
    }
  }

  // draw the node
  void render() {
    stroke(sC);
    strokeWeight(5);
    point(pos.x, pos.y);
  }

  // draw the lines
  void drawLine(Node _n) {
    stroke(127);
    strokeWeight(0.5);
    // created a distance() function to return the distance between two points
    // this function now accepts Node objects as arguments
    // note that accessing fields is done using . as in Object.field
    line(pos.x, pos.y, _n.pos.x, _n.pos.y);
  }

  float distance(Node _n) {
    // distance calculated as the hypotenuse formed 
    return pow( pow( _n.pos.x - pos.x, 2) + pow( _n.pos.y - pos.y, 2), 0.5);
  }

  boolean isDead() {
    return age > lifespan;
  }
}
