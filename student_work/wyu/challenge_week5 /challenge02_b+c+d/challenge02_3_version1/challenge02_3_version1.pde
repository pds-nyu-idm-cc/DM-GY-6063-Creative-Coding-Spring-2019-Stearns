//tranditional way of making collison on wall
float ballx1, bally1, x1speed, y1speed;//two balls
float ballx2, bally2, x2speed, y2speed;
float r;

void setup() {
  size(500, 400);
  r = 50;
  ballx1 = width/2;
  bally1 = height/2;
  x1speed = 1;
  y1speed = 4;
  ballx2 = width/2-30;
  bally2 = height/2- 20;
  x2speed = 3;
  y2speed = -2;
}

void draw() {
  background (255);
  fill(#FF2A49);
  strokeWeight(2);
  ellipse (ballx1, bally2, r, r);
  ellipse (ballx2, bally2, r, r);
//the direction of ball1
  ballx1 += x1speed;
  bally1 += y1speed;
//the bouncing of the ball1
  if (ballx1 >= width-r/2 || ballx1 <= r/2) {
    x1speed = -x1speed;
  }
  if (bally1 >= height-r/2 || bally1 <= r/2) {
    y1speed = -y1speed;
  }
//the direction of ball2
  ballx2 += x2speed;
  bally2 += y2speed;
//the bouncing of the ball2
  if (ballx2 >= width-r/2 || ballx2 <= r/2) {
    x2speed = -x2speed;
  }
  if (bally2 >= height-r/2 || bally2 <= r/2) {
    y2speed = -y2speed;
  }
}
