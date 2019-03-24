var ballx, bally, xspeed, yspeed;
var ballx2, bally2, x2speed, y2speed;

function setup() {
  createCanvas(400, 400);
	
	ballx = width/2;
  bally = height/2;
  xspeed = 1;
  yspeed = 4;

  ballx2 = 100;
  bally2 = 100;
  x2speed = 3;
  y2speed = -2;
}

function draw() {
  background (255);
  fill(255,0,0);
  noStroke();
  ellipse(mouseX, mouseY, 20, 20);
	
  fill (0);
  noStroke();
  ellipse (ballx, bally, 100, 100);
  ellipse (ballx2, bally2, 100, 100);
	
	ballx += xspeed;
  bally += yspeed;

  if (ballx >= width-50 || ballx <= 50) {
    xspeed = -xspeed;
  }
  if (bally >= height-50 || bally <= 50) {
    yspeed = -yspeed;
  }

  ballx2 += x2speed;
  bally2 += y2speed;

  if (ballx2 >= width-50 || ballx2 <= 50) {
    x2speed = -x2speed;
  }
  if (bally2 >= height-50 || bally2 <= 50) {
    y2speed = -y2speed;
  }
	

}