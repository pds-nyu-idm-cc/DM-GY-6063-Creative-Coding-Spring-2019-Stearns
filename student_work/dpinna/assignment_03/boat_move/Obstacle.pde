class Obstacle {

  PShape pirateIsland1 = loadShape("pirateIsland1.svg");
  PShape pirateIsland2 = loadShape("pirateIsland2.svg");
  PShape pirateIsland3 = loadShape("pirateIsland3.svg");
  PImage wreck = loadImage("wreck.png");
  int xpos, ypos;
  int type;

  Obstacle(int tempXpos, int tempYpos) {
    shapeMode(CENTER);
    xpos = tempXpos;
    ypos = tempYpos;
  }

  void display() {
    image(wreck, xpos, ypos);
    //if (type == 1) { 
    //  shape(pirateIsland1, xpos, ypos);
    //} else if (type == 2) {
    //  shape(pirateIsland2, xpos, ypos);
    //} else if (type == 3) {
    //  shape(pirateIsland3, xpos, ypos);
    //} else {
    //  shape(wreck, xpos, ypos);
    //}
  }
}
