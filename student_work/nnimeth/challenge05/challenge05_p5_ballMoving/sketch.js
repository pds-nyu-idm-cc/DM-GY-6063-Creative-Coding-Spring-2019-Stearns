var x = 150;
var y = 100;
var xspeed = 5;
var yspeed = 4;

function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(255);
  noStroke();
  fill(255,0,0);
  ellipse(x, y, 35,35);
  
  x += xspeed;
  y += yspeed;
  
  if (x< 0 || x> width){
    xspeed *= -1;
  }
  
  if( y < 0 || y > height){
    yspeed *= -1;
  }
  
}