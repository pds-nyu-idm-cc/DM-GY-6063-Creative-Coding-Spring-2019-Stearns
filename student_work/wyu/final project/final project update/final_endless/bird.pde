class Bird {
  PImage bird;
  PVector acceleration;
  PVector velocity;
  PVector location;
  PVector position;
  float someDistance = 50;
  float xpos, ypos;
  Bird(PVector l) { // the direction of the movement of bird
    bird=loadImage("niao.png");
    //acceleration = new PVector(0.05, 0);
    velocity = new PVector(2, 0);
    location = l.copy();
  }
  void update() {
    //velocity.add(acceleration);
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      location.x= 0;
      location.y= random(20, 300);
    }
  }

  void display() {  //the display of bird
    bird.resize(100, 0);
    // xpos= mouseX;
    // ypos = mouseY;

    image(bird, location.x, location.y);
    //position = new PVector(xpos, ypos);
  }
  
Boolean isTouchedWater(float watery) {  //detect whether touch the water
  float water = watery;
  return (location.y >= water);
}
  void up() {
    location.y = location.y-10;
  }
  void down() {
    location.y = location.y+10;
  }
  boolean isClicked() {  // detect whether the bird is clicked
    return PVector.dist(location, new PVector(mouseX, mouseY)) < someDistance;
  }
}
void dropStone() {  //drop stones
  stones.add( new Stone(new PVector( mouseX, mouseY)));
}
