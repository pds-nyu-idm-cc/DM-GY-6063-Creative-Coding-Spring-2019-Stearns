var x = 250;
var y = 250;

var value = 0;

function setup() {
  createCanvas(500,500);
	//pick colors randomly
	r = random(255);
	g = random(255);
	b = random(255);
}

function draw() {
 background(255);
 noStroke();
  
  //circle
  fill(r, g, b, 127);
  ellipse(x,y,100,100);
}
/*
function mouseMoved() {
  value = value +5;
  if (value > 255) {
    value = 0;
	} 
*/
	
function mousePressed() {
		let d = dist(mouseX,mouseY,x,y);
	if (d < 50) {
		//pick new random color values
	r = random(255);
	g = random(255);
	b = random(255);
	}
}