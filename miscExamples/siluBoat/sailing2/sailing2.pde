/**
 Adding a boat image to the previous example.
 Also a demonstration of using translate within pushMatrix()/popMatrix()
 to add interesting motion with sin()/cos() and noise().
 */

// Declare a Boat named boat
Boat boat;

PImage boatImage;

float scalePercent = .125;
void setup() {

  size(800, 800);

  boatImage = loadImage("boat.png");
  boatImage.resize(int(boatImage.width*scalePercent), int(boatImage.height*scalePercent));
  // create a new Boat and store it in boat
  boat = new Boat(100, 700, 700, 500, boatImage);

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
  float x, y, x2, y2, translateX, translateY; // x,y are where it actually is, x2, y2 and the end point, translateX and translateY add complex motion
  float xStep, yStep; // holds the speed of boat movement based on sailTime
  float rotateAngle = 0;
  float nx = random(1);
  float ny = random(1);
  float nStep = 0.025;
  float nAmt = 10;
  float angle = 0;
  float angleStep = 0.075;
  float amp = 5;
  float rockAmt =0.1;
  PImage image;

  Boat(float _x, float _y, float _x2, float _y2, PImage _image) {

    x=_x;
    y=_y;
    x2=_x2;
    y2=_y2;
    xStep = (x2 - x)/sailTime;
    yStep = (y2 - y)/sailTime;
    translateX=0;
    translateY=0;
    image = _image;
  }

  void display() {
    // use the image of the boat
    imageMode(CENTER);
    pushMatrix();
    translate(x+translateX, y+translateY);
    rotate(rotateAngle);
    image(image,0,0);
    // reset the translation
    translateX = 0;
    translateY = 0;
    popMatrix();
  }

  void move() {

    if (sailing) {

      this.sail();
    }
    this.rock();
    this.bob();
    this.shake();
  }


  void sail() {

    if (x!=x2 && y != y2) {

      x += xStep;
      y += yStep;
    }
    
  }

  void bob() {
    
    // adds up and down movement to the boat
    translateY += amp * sin(angle);
    angle+=angleStep;
    
  }

  void shake() {

    // adds a random movement to boat
    translateX += nAmt * noise ( nx );
    translateX += nAmt * noise ( ny );
    nx += nStep;
    ny += nStep;
    
  }

  void rock() {
    
    rotateAngle = rockAmt * cos(angle);
    
  }
  
}
