//PShape s, v;

class Boat {

  int xpos;
  int ypos;
  int xspeed;


  Boat(int tempXpos, int tempYpos) {
    shapeMode(CENTER);
    boat = loadShape("boat_color.svg");
    xpos = tempXpos;
    ypos = tempYpos;
    //xspeed = tempXspeed;
  }


  void display() {
    shape(boat, xpos, ypos, 100, 100);
  }

  void sail(int xpos, int ypos) {
    xpos = xpos + xspeed;
    ypos = ypos + xspeed;
  }
}
