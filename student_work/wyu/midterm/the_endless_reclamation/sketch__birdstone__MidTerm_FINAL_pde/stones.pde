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
    lifespan-=2;
  }
  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }
}
