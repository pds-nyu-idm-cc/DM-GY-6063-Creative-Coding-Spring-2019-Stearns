//declear variables

float x, y;
float x1, x2, y1, y2, shapeSize, stepY;
float a, b, r, moveA, moveB;


void setup() {
  //set screen size
  size(700, 700);
  //set background color
  background(0);


  //ball initial attribution
  a = -20; b = -20;
  r = width/18;
}



void draw() {

  //some background
  background(0);

  //set up play area
  stroke(255);
  strokeWeight (2);
  noFill();
  rect (width/8, height/8, width*6/8, height*6/8); 

  //playarea parameters
  //left:x=width/8;
  //top:y=height/8;
  //right:x=width*7/8;
  //bottom:y=height*7/8;

  //display background text
  String message = "Hello, Welcome to NYU Bouncy Ball";
  String message2 = "Click inside of the BOX to Drop the NYU Ball";
  textAlign (CENTER);
  textSize (18);
  fill(255);
  text(message, width/2, height/12);
  text(message2, width/2, height*11/12);
  
  drawShapes();

  //incremental motion
  //y=y+stepY;

  //draw bouncy ball
  stroke(255);
  fill(100, 68, 220);
  circle(a, b, r);

  //ball movement
  
  moveB+=1;
  
  a+=moveA;
  b+=moveB; 

  //adding gravity
  //moveB=moveB+1;

  //wall detection
  if (a < width/8 + r) {
    a = width/8 + r;
    moveA= -moveA;
  }
  if (a > width*7/8 - r) {
    a = width*7/8 - r;
    moveA = -moveA;
  }
  if (b < height/8 + r) {
    b = height/8 + r;
    moveB = -moveB;
  }
  if (b > height*7/8 - r) {
    b = height*7/8 - r;
    moveB = -moveB;
  }


  ////wrap around math

  //b=(b) % height*7/8;

  //println("a: "+moveA+", B: "+moveB);
  //println(moveB);
}

//user input and feedback
void mouseDragged() {
  a=mouseX;
  b=mouseY;
  moveA=moveB=0;
}

void mouseReleased() {
  a=mouseX;
  b=mouseY;
  moveA = -5; moveB = 4;
}
