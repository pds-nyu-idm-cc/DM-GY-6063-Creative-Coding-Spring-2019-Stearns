
class Ball{
  float x;
  float y;
  float r;
  Ball(float X,float Y,float R) {
    x = X;
    y = Y;
    r = R;
  }

void display() {
  ellipse(x, y, r, r);
}

void update() {
  x++;
  y--;
}
}
