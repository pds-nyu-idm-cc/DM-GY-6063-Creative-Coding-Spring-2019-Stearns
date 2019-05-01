/**
 Move a square slowly from start to end when
 we press any key
 */

// Declare a Boat named boat
Boat boat;


void setup() {
  
  size(800, 800);

  // create a new Boat and store it in boat
  boat = new Boat(100, 700, 700, 500);

  // reduce framrate from default of 60 fps to 30
  frameRate(30);
  
}

void draw() {

  background(25, 75, 127);
  
  boat.move();
  boat.display();
  
}

void keyPressed() {
  
  boat.sailing = !boat.sailing;
  
}

class Boat {

  boolean sailing = false;
  float sailTime = 600.0; // how many frames should it take to get from start to finish
  float x, y, x2, y2; // x,y are where it actually is, x2, y2 and the end point
  float xStep, yStep; // holds the speed of boat movement based on sailTime

  Boat(float _x, float _y, float _x2, float _y2) {
    
    x=_x;
    y=_y;
    x2=_x2;
    y2=_y2;
    xStep = (x2 - x)/sailTime;
    yStep = (y2 - y)/sailTime;

    
  }

  void display() {
    
    rectMode(CENTER);
    square(x, y, 25);
    
  }

  void move() {
    
    if (sailing) {
      
      this.sail(); // we use "this" to refer to the current instance
      
    }
    
  }


  void sail() {
    
    if (x!=x2 && y != y2) {
      
      x += xStep;
      y += yStep;
      
    }
    
  }


}
