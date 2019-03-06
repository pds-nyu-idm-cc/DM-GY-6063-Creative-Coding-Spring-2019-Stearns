var x = 250;
var y = 250;
var posY = 0; 

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

function mousePressed() {
		let d = dist(mouseX,mouseY,x,y);
	if (d < 50) {
		//move up
		y = y - 20;
	} 
		//collision detection
	if (y > 0){
		y = y + 10;
	}
}