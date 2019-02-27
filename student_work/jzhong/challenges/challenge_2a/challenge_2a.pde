float x, y;
float xa = 100, ya = 100, xb = 400, yb = 400;
float r = 30;
float speedX, speedY;

void setup () {
  background(0);
  size(500, 500);
}

void draw () {
  background(0);
  //ball a
  x = xa; 
  y = ya;
  drawBall();
  //ball b
  x = xb; 
  y = yb;
  drawBall();

  //movement
  speedX = 3; speedY = 4;
  movement();
  
  //wall detection;
  
}
