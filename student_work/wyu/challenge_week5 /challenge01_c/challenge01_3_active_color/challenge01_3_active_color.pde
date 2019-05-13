//Add a feature that will toggle between
//pressed and inactive states. There should be 
//three colors in play: inactive, pressed, and active.
float d;
float c ;
float r = 50;
Boolean mouseIsclicked = false;
void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  strokeWeight(2);
  stroke(0);
  // distance between the ball and the mouse
  d =dist(width/2, height/2, mouseX, mouseY);
  // active color
  if (d< r) {
    c = 200;
    // the pressed color 
    if (mouseIsclicked) {
      c= 30;
    }
    //inactive color
  } else {
    c = 150;
    mouseIsclicked = false;
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
