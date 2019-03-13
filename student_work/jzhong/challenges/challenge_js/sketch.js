var x=0,y=0;
var easing = 0.05;
var targetX, targetY, dx, dy;

function setup(){
  background(190);
  createCanvas(500,500);
}

function draw(){

  background(190);

  targetX = mouseX;
  dx = targetX - x;
  x += dx * easing;

  targetY = mouseY;
  dy = targetY - y;
  y += dy * easing;


  fill(0);
  stroke(255);
  circle(x,y,50);

	// draw();

}
