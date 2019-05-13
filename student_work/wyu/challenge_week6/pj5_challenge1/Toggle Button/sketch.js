var r = 50;
var d;
var c ;
var mouseIsclicked = false;
function setup() {
  createCanvas(800, 600);
  background(255);
}

function draw() {
  strokeWeight(2);
  stroke(0);
  // distance between the ball and the mouse
  d =dist(width/2, height/2, mouseX, mouseY);
  // active color
  if (d < r) {
    c = 200;
    // the pressed color 
    if (mouseIsclicked) {
      c= 30;
    }
    //inactive color
  } else {
    c = 150;
  }
  fill(c);
  ellipse(width/2, height/2, 2*r, 2*r);
}
// when mouse pressed in the range of the circle
function touchStarted(){
  if (d<r) {
    mouseIsclicked = true;
  }
}