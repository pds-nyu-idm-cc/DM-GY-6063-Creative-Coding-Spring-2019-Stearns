PVector position;
PVector acceleration;
PVector speed;
float dampening = 0.99;
float size = 50;

void setup() {
  size(500, 500);
  background(127);

  // place the ball in the center of our screen
  position = new PVector(width/2, height/2);
  acceleration = new PVector();
  randomizeSpeed();
  
  background(255);
  
}

void draw() {
  
  background(255);
  
  acceleration = PVector.sub(position, new PVector(mouseX,mouseY));
  acceleration.setMag(100/pow(PVector.dist(position, new PVector(mouseX,mouseY)),2));
  speed.add(acceleration);
  position.add(speed);
  speed.mult(dampening);
  speed.limit(10);
  
  bounce();
  fill(127);
  circle(position.x, position.y, size);
  drawSpeedVector();
  
}



void mousePressed(){
}

void bounce(){
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
}

void drawSpeedVector(){
  // speed vector
  PVector drawSpeed = speed.copy();
  drawSpeed.setMag(50/2);
  pushMatrix();
  translate(position.x, position.y);
  line(0 , 0 , drawSpeed.x, drawSpeed.y );
  popMatrix();
}

void randomizeSpeed(){
  speed = PVector.random2D();
  speed.mult(1);
}
