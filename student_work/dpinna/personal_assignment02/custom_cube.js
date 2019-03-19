let lines = [];

function setup() {
  createCanvas(1200, 600, WEBGL);
  // ortho(-300, 300, 600, -600, 0.1, 100);

  // background('#293845');
  smooth();

  //width = 1200
  //height = 600

  // rect(x,y,width,height)

  stroke(255);
  a = height/2; // 300

  // creating a group of lines.


  // for (let i = 0; i < 50; i++) {
  //   lines.push(new Custom_Line());
  // }

}

function draw() {
  x = -width / 2 + 1
  // y = -height / 2

  rotateX(PI/4);

  background(51);
  stroke("grey");
  strokeWeight(1);
  line(x, -a, width/2, -a);
  line(x, -a+50, width/2, -a+50);
  line(x, -a+100, width/2, -a+100);
  line(x, -a+150, width/2, -a+150);
  line(x, -a+200, width/2, -a+200);
  line(x, -a+250, width/2, -a+250);
  line(x, -a+300, width/2, -a+300);
  line(x, -a+350, width/2, -a+350);
  line(x, -a+400, width/2, -a+400);
  line(x, -a+450, width/2, -a+450);
  line(x, -a+500, width/2, -a+500);

  a -= 5;
  if (a < -300) {
    a = height/2;
  }

  // background('#293845');

  // for (i = height; i >0; i -= 0.5) {
  //   stroke("#CDCDCD");
  //   strokeWeight(1);
  //   line(-width/2, i, width/2, i);
  //
  // }




  //places rectangle to (0,0)

  // strokeWeight(1);
  // rect(x, y, 100, 100);


  // rotateZ(PI/8);

  // fill('green')
  // // rect(-600,-300,600,300)
  // // box(width,height,depth)
  // box(10, 50, 30);
  //
  noStroke();
  fill(4, 50, 76) //navy-ish blue
  rect(-600,-300,1200,900)
  stroke('yellow')
  line(-1000,-300,1000,-300)
  var myLine = new Custom_Line(-1000, a, 1000, a, 0, 10);
  myLine.display();

  noStroke();
  fill("cyan")
  rect(-1500,-1000,3000,700)
  // rect(1, 0, width/2, -height/2);
  //
  //
  // fill('red')
  // // rect(0,0,600,300)
  // rect(1, 0, width/2, height/2);
  //
  // fill('yellow')
  // // rect(0,0,-600,300)
  // rect(1, 0, -width/2, height/2);


  // // stroke(170);
  // strokeWeight(1);
  // //show me the 0,0
  // line(-20, 0, 20, 0);
  // line(0, -20, 0, 20);

  // for (let i = 0; i < lines.length; i++) {
  //   lines[i].display();
  // }

  // translate(x,y,z);
  // rectMode(CENTER);

  // box(100,100,200);
  // rect(100,100,50,50)

  // for (var x = -width/2+1; x <= width; x += width / 10) {
  // 		for (var y = -height/2; y <= height-1; y += height / 5) {
  // 			stroke(170);
  // 			strokeWeight(1);
  // 			line(x, -height/2+1, x, height);
  // 			line(-width/2+1, y, width, y);
  // 		}
  // 	}
  // var a = height/2;;
  // a -= 0.5;
  // console.log(a);



  // if (a < 0) {
  //   a = height;
  // }
  //
  // line(0, a, width, a);

  // for (var x = -width/2+1; x <= width; x += width / 10) {
  // 		// for (var y = -height/2; y <= height-1; y += height / 5) {
  // 			stroke(170);
  // 			strokeWeight(1);
  // 			line(x, -height/2+1, x, height);
  // 			// line(-width/2+1, y, width, y);
  // 		// }
  // 	}



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
        // line(this.x1 + this.xSpacing, this.y1 +this.ySpacing+i*3, this.x2 + this.xSpacing, this.y2 + this.ySpacing+i*3);
        // line(this.x1 + this.xSpacing, this.y1 +this.ySpacing+i*4, this.x2 + this.xSpacing, this.y2 + this.ySpacing+i*4);
        // line(this.x1 + this.xSpacing, this.y1 +this.ySpacing+i*5, this.x2 + this.xSpacing, this.y2 + this.ySpacing+i*5);
      }

    }

  }
