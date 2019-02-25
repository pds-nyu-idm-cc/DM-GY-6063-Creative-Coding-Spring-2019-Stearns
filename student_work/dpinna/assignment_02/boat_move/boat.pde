//PShape s, v;

class Boat {

  int startTime = 0;
  int xpos, ypos, boatSpeed;
  float wind;
  boolean moveLeft, moveRight, moveUp, moveDown;
  PImage party;

  Boat(int tempXpos, int tempYpos) {
    shapeMode(CENTER);
    xpos = tempXpos;
    ypos = tempYpos;
    moveLeft = false;
    moveRight = false;
    moveUp = false;
    moveDown = false;
    boatSpeed = 10;
    party  = loadImage("boat_party.png");
  }

  void setState() {
    //create a class to define different boat "states"
    //1. anchored = boat = loadShape("boat_anchored.svg"); 
    //2. sailing = boat = loadShape("boat_sailing.svg");
    //for now solved with global vars but maybe better if we move them in here?
  }

  void display() {
    startTime = second();
    shape(boatImage, xpos, ypos, 150, 150);    
  }

  void move() {
    if (moveLeft) { 
      xpos -= boatSpeed;
    }
    if (moveRight) { 
      xpos += boatSpeed;
    }
    if (moveUp) { 
      ypos -= boatSpeed;
    }
    if (moveDown) { 
      ypos += boatSpeed;
    }

    //xpos +=1;
    //ypos +=0.5;

    if (moveRight) {
      boatImage = sailingRight;
    } else if (moveRight && moveUp) {
      boatImage = sailingRight;
    } else if (moveUp) {
      boatImage = sailingRight;
    } else if (moveDown) {
      boatImage = sailingRight;
    } else if (moveRight && moveDown) {
      boatImage = sailingRight;
    } else if (moveLeft) {
      boatImage = sailingLeft;
    } else if (moveLeft && moveUp) {
      boatImage = sailingLeft;
    } else if (moveLeft && moveDown) {
      boatImage = sailingLeft;
    } else {
      boatImage = boatAnchored;
    }
  }
}
