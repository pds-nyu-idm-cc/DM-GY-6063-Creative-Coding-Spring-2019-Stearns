PVector position;
PVector speed;
PVector acceleration;

// acceleration due to gravity
float gravity = 1;
float dampening = .99;
float size = 50;
float mass = 1;

void setup() {
  size(500, 500);
  background(127);

  // place the ball in the center of the screen
  position = new PVector(width/2, height/2);
  speed = new PVector();
  acceleration = new PVector();
}

void draw() {

  //background(127);
  
  acceleration = PVector.sub(position, new PVector(mouseX, mouseY));
  acceleration.setMag(0.5);

  
  speed.add(acceleration);
  speed.limit(10);

  // add the speed value to the position
  position.add(speed);

  // logic to make the ball bounce
  if ( position.x > width-(size/2) ) {
    position.x = width-(size/2);
    speed.x *= -1;
  }
  if (position.x < size/2) {
    position.x = size/2;
    speed.x *= -1;
  }

  if ( position.y > height-(size/2) ) {
    position.y = height-(size/2);
    speed.y *= -1;
  }
  if (position.y < size/2) {
    position.y = size/2;
    speed.y *= -1;
  }
  
  speed.mult(dampening);
  
  fill(speed.mag()*25);
  
  circle(position.x, position.y, size);
}

void mousePressed(){
  pushAway();
}

void pushAway(){
  speed = PVector.sub(position, new PVector(mouseX,mouseY));
  speed.mult(10);
}
