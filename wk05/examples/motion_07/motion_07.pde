PVector position;
PVector speed;
PVector acceleration;

// acceleration due to gravity
float gravity = 1;
float dampening = .99;
float size = 50;

void setup() {
  size(500, 500);
  background(127);

  // place the ball in the center of our screen
  position = new PVector(width/2, height/2);
  randomizeSpeed();
  acceleration = new PVector(0, gravity);
}

void draw() {

  //background(127);

  // add acceleration due to gravity to the speed_y
  speed.add(acceleration);

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

  //// wrap around the screen
  //x = (x + width) % width;
  //y = (y + height) % height;
  
  fill(speed.mag()*25);
  
  circle(position.x, position.y, size);
}

void mousePressed(){
  randomizeSpeed();
}

void randomizeSpeed(){
  speed = PVector.random2D();
  speed.mult(10);
}
