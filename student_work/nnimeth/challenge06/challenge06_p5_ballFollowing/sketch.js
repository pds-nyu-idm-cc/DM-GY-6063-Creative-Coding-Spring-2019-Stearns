var x=0;
var y=0;
var circleX =0;
var circleY=0;

var easing = 0.05;

function setup() {
  createCanvas(400, 400);
}


function draw() {
  background(255);
  
  var circleX = mouseX; 
  var dx = circleX - x;
  x += dx * easing;
  
  var circleY = mouseY;
  var dy = circleY -y;
  y += dy * easing;


  noStroke();
  fill(255,0,0);
  ellipse(x,y, 35,35);
    
  
}