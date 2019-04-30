class Stone {
  PVector acceleration;
  PVector velocity;
  PVector location;
  float lifespan=255;
  Stone(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.copy();
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if (location.y > height) {
      // We're reducing velocity ever so slightly 
      // when it hits the bottom of the window
      velocity.y = velocity.y * -0.05; 
      location.y = height;
    }
    //lifespan-=2;
  }
  boolean isDead() {
    if (location.x <= 300) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    //stroke(0, lifespan);
    //strokeWeight(2);
    noStroke();
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
}
