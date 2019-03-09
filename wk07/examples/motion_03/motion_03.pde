// position
float x;
float y;

// speed
float speed_x = 6;
float speed_y = 3;

// acceleration due to gravity
float gravity = 1;

float size = 50;

void setup() {
  size(500, 500);
  background(127);

  // place the ball in the center of our screen
  x = width / 2;
  y = height / 2;
}

void draw() {

  background(127);

  // add acceleration due to gravity to the speed_y
  speed_y += gravity;

  // add the speed value to the position
  x += speed_x;
  y += speed_y;

  // logic to make the ball bounce
  if ( x > width ) {
    x = width;
    speed_x *= -1;
  }
  if (x < 0) {
    x = 0;
    speed_x *= -1;
  }

  if ( y > height ) {
    y = height;
    speed_y *= -1;
  }
  if (y < 0) {
    y = 0;
    speed_y *= -1;
  }

  //// wrap around the screen
  //x = (x + width) % width;
  //y = (y + height) % height;

  circle(x, y, size);
}
