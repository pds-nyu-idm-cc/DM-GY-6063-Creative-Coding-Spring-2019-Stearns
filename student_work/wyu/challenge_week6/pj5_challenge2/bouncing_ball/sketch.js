//tranditional way of making collison on wall
var ballx1, bally1, x1speed, y1speed;//two balls
var ballx2, bally2, x2speed, y2speed;
var r;

function setup() {
  createCanvas(500, 400);
	
  r = 50
  ballx1 = width/2;
  bally1 = height/2;
  x1speed = 1;
  y1speed = 4;

  ballx2 = width/2-30;
  bally2 = height/2- 20;
  x2speed = 3;
  y2speed = -2;
}

function draw() {
  background (255);
  fill (150);
  strokeWeight(2);
  ellipse (ballx1, bally2, r, r);
  ellipse (ballx2, bally2, r, r);
	
  ballx1 += x1speed;
  bally1 += y1speed;
//the bouncing of the balls
  if (ballx1 >= width-r/2 || ballx1 <= r/2) {
    x1speed = -x1speed;
  }
  if (bally1 >= height-r/2 || bally1 <= r/2) {
    y1speed = -y1speed;
  }

  ballx2 += x2speed;
  bally2 += y2speed;

  if (ballx2 >= width-r || ballx2 <= r/2) {
    x2speed = -x2speed;
  }
  if (bally2 >= height-r || bally2 <= r/2) {
    y2speed = -y2speed;
  }
}