int iterations = 300;
float radius;
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  radius = width*1.5;
  drawCircles(radius, iterations);
}

void draw() {
}

void drawCircles(float _radius, int _depth) {
  int i = _depth - 1;
  fill(color(random(256), random(256), random(256)));
  circle(width/2, height/2, _radius);
  if (i>0) {
    drawCircles( i * _radius/_depth, i);
  }
}

void keyPressed(){
  drawCircles(radius, iterations);
}

void mousePressed(){
  loadPixels();
  color pixel = pixels[ mouseX + mouseY * width];
  float red = red(pixel);
  float green = green(pixel);
  float blue = blue(pixel);
  println("Red: "+red+", Green: "+green+", Blue: "+blue);
}
