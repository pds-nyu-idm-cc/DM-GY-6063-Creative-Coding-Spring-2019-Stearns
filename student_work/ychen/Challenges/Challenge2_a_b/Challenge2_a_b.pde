float ballx, bally, xspeed, yspeed;
float ballx2, bally2, x2speed, y2speed;

void setup() {
  size(500, 500);

  initBall();
}

void draw() {
  background (0);
  fill (255);
  noStroke();
  ellipse (ballx, bally, 100, 100);
  ellipse (ballx2, bally2, 100, 100);

  moveBall();
}

void moveBall() {

  ballx += xspeed;
  bally += yspeed;

  if (ballx >= width-50 || ballx <= 50) {
    xspeed = -xspeed;
  }
  if (bally >= height-50 || bally <= 50) {
    yspeed = -yspeed;
  }

  ballx2 += x2speed;
  bally2 += y2speed;

  if (ballx2 >= width-50 || ballx2 <= 50) {
    x2speed = -x2speed;
  }
  if (bally2 >= height-50 || bally2 <= 50) {
    y2speed = -y2speed;
  }
}
