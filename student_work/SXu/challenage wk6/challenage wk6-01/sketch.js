var a;
var mousePress = false;


function setup() {
  background(255);
  createCanvas(500, 500);
}

function draw() {
	strokeWeight(10);
  stroke(255);
  a = dist(width/2, height/2, mouseX, mouseY);

  if (a< 40) {
    fill(200, 77, 119);
  } else if (mousePress == true) {
    fill(200, 77, 0);
  } else {
    fill(200);
  }
  circle(width/2, height/2, 40);
}

function mousePressed() {
  mousePress = true;
}