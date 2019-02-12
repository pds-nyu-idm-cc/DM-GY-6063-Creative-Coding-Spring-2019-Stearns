//PShape s, v;

class Boat {

  int xpos;
  int ypos;
  int xspeed;


  Boat(int tempXpos, int tempYpos) {
    shapeMode(CENTER);
    v = loadShape("boat_color.svg");
    xpos = tempXpos;
    ypos = tempYpos;
    //xspeed = tempXspeed;
  }


  void display() {
    shape(v, xpos, ypos, 100, 100);
  }

  void sail(int xpos, int ypos) {
    xpos = xpos + xspeed;
    ypos = ypos + xspeed;
  }
}
