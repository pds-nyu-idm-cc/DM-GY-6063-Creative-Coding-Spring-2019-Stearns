var x, y, r = 50;
var speedX = 5, speedY = 6;

function setup() {
	createCanvas(500, 500);
	
	x = width/2;
	y = height/2;
}

function draw() {
	background(100);
	ellipse(x, y, r, r);
	
	x += speedX;
	y += speedY;
	
	if (x < 0) {
		speedX = -speedX;
		x = 0;
	} else if (x > width) {
		speedX = -speedX;
		x = width;
	}
	if (y < 0) {
		speedY = -speedY;
		y = 0;
	} else if (y > height) {
		speedY = -speedY;
		y = height;
	}
	
}