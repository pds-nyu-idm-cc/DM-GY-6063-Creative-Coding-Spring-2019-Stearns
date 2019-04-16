let lines = [];

function setup() {
  createCanvas(1200, 600, WEBGL);
  // ortho(-300, 300, 600, -600, 0.1, 100);
  // background('#293845');
  smooth();

  stroke(255);
  a = height/2; // 300

}

function draw() {
  x = -width / 2 + 1
  // y = -height / 2

  rotateX(PI/4);

  background(51);
  stroke("grey");
  strokeWeight(1);
  line(x, -a, width/2, -a);
  // line(x, -a+50, width/2, -a+50);
  // line(x, -a+100, width/2, -a+100);
  // line(x, -a+150, width/2, -a+150);
  // line(x, -a+200, width/2, -a+200);
  // line(x, -a+250, width/2, -a+250);
  // line(x, -a+300, width/2, -a+300);
  // line(x, -a+350, width/2, -a+350);
  // line(x, -a+400, width/2, -a+400);
  // line(x, -a+450, width/2, -a+450);
  // line(x, -a+500, width/2, -a+500);

  a -= 5;
  if (a < -300) {
    a = height/2;
  }

  noStroke();
  fill(4, 50, 76) //navy-ish blue
  rect(-600,-300,1200,900)
  stroke('yellow')
  line(-1000,-300,1000,-300)
  // var myLine = new Custom_Line(-1000, a, 1000, a, 0, 10);
  // myLine.display();

  noStroke();
  fill("#1873C7")
  rect(-1500,-1000,3000,700)

}
  class Custom_Line {

    constructor(x1, y1, x2, y2, xSpacing, ySpacing) {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
      this.xSpacing = xSpacing;
      this.ySpacing = ySpacing;
    }

    display() {
      for (var i = 0; i < 200; i+=20) {
        line(this.x1 + this.xSpacing, this.y1 +this.ySpacing+i, this.x2 + this.xSpacing, this.y2 + this.ySpacing+i);
        line(this.x1 + this.xSpacing, this.y1 +this.ySpacing+i*2, this.x2 + this.xSpacing, this.y2 + this.ySpacing+i*2);

      }

    }

  }
