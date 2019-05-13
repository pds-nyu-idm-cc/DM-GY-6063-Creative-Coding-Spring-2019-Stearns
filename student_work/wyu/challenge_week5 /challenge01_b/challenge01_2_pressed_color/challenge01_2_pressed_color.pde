//pressed color;
float d;
float c;
float r = 50;
Boolean mouseIsclicked = false;
void setup() {
  size(800, 600);
  background(255);
}
//challenge 1
void draw() {
  strokeWeight(2);
  stroke(0);
  // distance between the ball and the mouse
  d =dist(width/2, height/2, mouseX, mouseY);

  // move mouse over change the color
  if (mouseIsclicked) {

    c= 50;
  } else {
    c = 255;
  }
  fill(c);
  ellipse(width/2, height/2, 2*r, 2*r);
}
// when mouse pressed in the range of the circle
void mousePressed() {
  if (d<r) {
    mouseIsclicked = true;
  }
}
