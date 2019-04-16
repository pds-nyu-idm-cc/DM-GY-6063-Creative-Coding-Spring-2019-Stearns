
class Bird {
  PImage bird;
  PVector position;
  float someDistance = 5;
  float xpos, ypos;
  Bird() {
    bird=loadImage("niaoniaoniao");
  }
  void display() {
    bird.resize(80, 0);
    xpos= mouseX;
    ypos = mouseY;

    image(bird, xpos, ypos);
    position = new PVector(xpos, ypos);
  }



  boolean isClicked() {
    return PVector.dist(position, new PVector(mouseX, mouseY)) < someDistance;
  }
}
