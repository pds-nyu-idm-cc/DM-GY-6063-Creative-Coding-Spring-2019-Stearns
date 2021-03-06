class Bird {
  PImage bird;
  PVector acceleration;
  PVector velocity;
  PVector location;
  PVector position;
  float someDistance = 50;
  float xpos, ypos;
  Bird(PVector l) {
    bird=loadImage("niao.png");
    //acceleration = new PVector(0.05, 0);
    velocity = new PVector(3, 0);
    location = l.copy();
  }
  void update() {
    //velocity.add(acceleration);
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      location.x=0;
    }
  }

  void display() {
    bird.resize(100, 0);
    // xpos= mouseX;
    // ypos = mouseY;

    image(bird, location.x, location.y);
    //position = new PVector(xpos, ypos);
  }



  boolean isClicked() {
    return PVector.dist(location, new PVector(mouseX, mouseY)) < someDistance;
  }
}
void dropStone() {
  stones.add( new Stone(new PVector( mouseX, mouseY)));
}
