class Mover {

  PVector position;
  PVector speed;
  PVector acceleration;
  float dampening = .99;
  float size = 50;
  float mass = 1;

  Mover() {
    position = new PVector(random(width), random(height));
    speed = new PVector();
    acceleration = new PVector();
  }

  void update() {
    acceleration = PVector.sub(position, new PVector(mouseX, mouseY));
    acceleration.setMag(-0.5);
    speed.add(acceleration);
    speed.limit(10);
    position.add(speed);
    bounce();
    speed.mult(dampening);
  }

  void render() {
    fill(speed.mag()*25);
    circle(position.x, position.y, size);
  }

  void bounce() {
    // bounce off sides
    if ( position.x > width-(size/2) ) {
      position.x = width-(size/2);
      speed.x *= -1;
    }
    if (position.x < size/2) {
      position.x = size/2;
      speed.x *= -1;
    }

    // bounce off top/bottom
    if ( position.y > height-(size/2) ) {
      position.y = height-(size/2);
      speed.y *= -1;
    }
    if (position.y < size/2) {
      position.y = size/2;
      speed.y *= -1;
    }
  }

  void pushAway() {
    speed = PVector.sub(position, new PVector(mouseX, mouseY));
    speed.mult(10);
  }
  
}
