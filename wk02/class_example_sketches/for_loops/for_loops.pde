color lineColor = color(127);
int x, y, originX, originY;
float stepX, stepY, size;

void setup() {
  size(500, 500);
  background(255);
  originX = 0;
  originY = 0;
  stepX=-2;
  stepY=4;
  size=250;
  noLoop();
}

void draw() {
  background(255);

  for (int i = 0; i < 100; i++) {
    line(originX-size+(i*stepX), originY-size+(i*stepY), originX+size+(i*stepX), originY+size+(i*stepY));
  }
}
