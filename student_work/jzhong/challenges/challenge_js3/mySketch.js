let b1, b2, b3, b4, b5;


function setup() {
	createCanvas(500, 500);
	// b1 = new Button(random(width), random(height), random(30, 50), color (random(255), random(255), random(255)));
	// b2 = new Button(random(width), random(height), random(30, 50), color (random(255), random(255), random(255)));
	// b3 = new Button(random(width), random(height), random(30, 50), color (random(255), random(255), random(255)));
	// b4 = new Button(random(width), random(height), random(30, 50), color (random(255), random(255), random(255)));
	// b5 = new Button(random(width), random(height), random(30, 50), color (random(255), random(255), random(255)));
	b1 = new Button();
}

function draw() {
	background(100);
	
	
	b1.display();
	if (mousePressed == true) {
		b1.update();
	}
	b2.display();
	if (mousePressed == true) {
		b2.update();
	}
	b3.display();
	if (mousePressed == true) {
		b3.update();
	}
	b4.display();
	if (mousePressed == true) {
		b4.update();
	}
	b5.display();
	if (mousePressed == true) {
		b5.update();
	}
}

class Button {
	// var x;
	// var y;
	// var r;
	// var c;
  constructor(){
		this.x=random(width);
		this.y=random(height);
		this.r=random(30,50);
		this.c=color (random(255),random(255),random(255));
  // Button(var _x, var _y, var _r, var _c) {
  //   x = _x;
  //   y = _y;
  //   r = _r;
  //   c = _c;
  // }
  
  function display() {
    noStroke();
    fill(this.c);
    circle(this.x,this.y,this.r);
  }

  
  function update() {
    if (dist(this.x,this.y,mouseX,mouseY)<r){
      this.x = random(0,width);
      this.y = random(0,height);
      this.c = color (random(255), random(255), random(255));
      this.r = random(30,50);
    }
  }
  
}


	
	
