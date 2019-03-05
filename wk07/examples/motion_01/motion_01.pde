// position
float x;
float y;
// speed
float speed_x = -2.5;
float speed_y = 3.75;
float size = 25;

void setup(){
  size(500,500);
  background(127);
  
  // place the ball in the center of our screen
  x = width / 2;
  y = height / 2;
  
}

void draw(){
  
  background(127);
  
  // add the speed value to the position
  x += speed_x;
  y += speed_y;
  
  // wrap around the screen
  x = (x + width) % width;
  y = (y + height) % height;
  
  circle(x, y, size);
}
