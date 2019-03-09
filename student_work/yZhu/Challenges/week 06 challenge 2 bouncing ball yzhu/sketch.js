var x = 10;
var y = 10;
var xspeed = 5;
var yspeed = 7;


function setup() {
	createCanvas(400, 400);


}

function draw() {
	background(25);

	//distance from center of the screen
	var d = dist(width / 2, height / 2, mouseX, mouseY);

	fill(random(200, 250), random(200, 250), random(200, 250));
	ellipse(x, y, d, d);

	//bouncing horizontally
	x = x + xspeed;

	if (x > width || x < 0) {
		xspeed = -xspeed;
	}

	//bouncing veritcally
	y = y + yspeed;

	if (y > height || y < 0) {
		yspeed = -yspeed;
	}

}