class Bubbles {
  //fields
  PVector position;
  PVector speed;
  PVector acceleration;
  float dampening = .99;
  float size = 20;

  // constructor
  Bubbles() {
    position = new PVector(random(width), random(height));
    speed = new PVector();
    acceleration = new PVector();
  }

  // moves the bubbles
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
    // simulates air friction
    speed.mult(dampening);
  }

  void render() {
    // use the speed to set brightness
    fill(speed.mag()*25, random(0, 255), random(0, 255));
    noStroke();
    // draw a circle
    circle(position.x, position.y, size); // big bubble
    circle(position.x - 30, position.y -40, size/2); // small bubble
  }
}
