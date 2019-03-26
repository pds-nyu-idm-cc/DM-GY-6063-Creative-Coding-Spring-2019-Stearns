class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float fade = 255;
  Particle(PVector a) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location = a.get();
  }
  //update the location of particles
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    fade -= 2;
  }
  boolean isDead() {
    if (fade <= 0) {
      return true;
    } else {
      return false;
    }
  }

  // display particles
  void display() {
    stroke(0, fade);
    strokeWeight(1);
    fill(150, fade);
    ellipse(location.x, location.y, 12, 12);
  }
}
