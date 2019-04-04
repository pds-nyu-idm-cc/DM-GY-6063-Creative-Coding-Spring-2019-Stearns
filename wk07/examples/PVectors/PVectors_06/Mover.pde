class Mover {
  //fields
  PVector position;
  PVector speed;
  PVector acceleration;
  float dampening = .99;
  float size = 50;

  // constructor
  Mover() {
    position = new PVector(random(width), random(height));
    speed = new PVector();
    acceleration = new PVector();
  }
  
  // moves the mover
  void update() {
    // calculate the acceleration vector towards the mouse
    acceleration = PVector.sub(new PVector(mouseX, mouseY), position);
    acceleration.setMag(0.5);
    // add the acceleration vector to the speed vector 
    speed.add(acceleration);
    // limit the speed
    speed.limit(10);
    // add the speed vector to position (move it)
    position.add(speed);
    // bounce off the walls
    bounce();
    // simulates air friction
    speed.mult(dampening);
  }

  void render() {
    // use the speed to set brightness
    fill(speed.mag()*25);
    // draw a circle
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
  
  boolean isClicked(){
    return PVector.dist(position, new PVector(mouseX,mouseY)) < size/2;
  }
  
}
