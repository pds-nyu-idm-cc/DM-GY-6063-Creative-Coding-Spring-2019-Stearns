//Make a circle detects when you move your mouse over
///it by changing to a "highlight" color.

float d;
float r = 50;
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
  if (d< r) {
    fill(#FED7DA);
  } else {
    fill(255);
  }
  ellipse(width/2, height/2, 2*r, 2*r);
}
