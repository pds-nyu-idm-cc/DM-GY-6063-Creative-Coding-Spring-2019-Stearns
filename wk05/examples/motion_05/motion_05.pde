// position
float x;
float y;

// speed
float speed_x = 6;
float speed_y = 3;

// acceleration due to gravity
float gravity = 1;

float dampening = .99;

float size = 50;

void setup() {
  size(500, 500);
  background(127);

  // place the ball in the center of our screen
  x = width / 2;
  y = height / 2;
}

void draw() {

  //background(127);

  // add acceleration due to gravity to the speed_y
  speed_y += gravity;

  // add the speed value to the position
  x += speed_x;
  y += speed_y;

  // logic to make the ball bounce
  if ( x > width-(size/2) ) {
    x = width-(size/2);
    speed_x *= -1;
  }
  if (x < size/2) {
    x = size/2;
    speed_x *= -1;
  }

  if ( y > height-(size/2) ) {
    y = height-(size/2);
    speed_y *= -1;
  }
  if (y < size/2) {
    y = size/2;
    speed_y *= -1;
  }
  
  speed_x *= dampening;
  speed_y *= dampening;

  //// wrap around the screen
  //x = (x + width) % width;
  //y = (y + height) % height;

  circle(x, y, size);
}

void mousePressed(){
  speed_x = random(-10,10);
  speed_y = random(-10,-5);
}
