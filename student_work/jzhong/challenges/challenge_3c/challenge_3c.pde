float x = width/2, y = height/2;
float easing = 0.05;
float rateX = 1;
float rateY = 2;

void setup() {
  background(190);
  size(500, 500);
}

void draw() {
  background(190);
  x += rateX;
  y += rateY;
  float targetX = mouseX;
  float dx = targetX - x;
  if (dx < 50) {
    x += -dx * easing;
  }

  float targetY = mouseY;
  float dy = targetY - y;
  if (dy < 50) {
    y += -dy * easing;
  }
  wallDetection();

  fill(0);
  stroke(255);
  circle(x, y, 50);
}
