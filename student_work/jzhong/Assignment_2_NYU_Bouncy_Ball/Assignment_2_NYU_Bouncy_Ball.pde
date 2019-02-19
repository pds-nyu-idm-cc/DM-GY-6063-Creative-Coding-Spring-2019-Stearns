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


  //some art/shapes in margin

  //left side
  //initialize variabyles
  x=width/32;  //reference point x-axis
  y=height/8;  //reference point y-axis
  shapeSize=width/16; //all shapes have same width&height
  //increments
  stepY=-50;
  //start shapes
  noStroke();

  //shape #1

  //set location
  x1=x;
  x2=x+shapeSize;
  y1=y;
  y2=y+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  quad(x1, y1, x2, y1, x1, y2, x2, y2);

  //shape #2

  //change location
  x1=x+shapeSize/2;
  y1=y*3;
  //draw shape
  fill(random (256), random (256), random (256));
  circle(x1, y1, shapeSize);

  //shape #3

  //change location
  x1=x;
  y1=y*4+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));  
  square(x1, y1, shapeSize);

  //shape #4

  //change location
  x1=x;
  x2=x+shapeSize;
  y2=y+height*6/8;
  y1=y2-shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  triangle(x1, y2, x2, y2, x+shapeSize/2, y1);

  //right side
  //initialize variabyles
  x=width-width*3/32;  //reference point x-axis
  y=height/8;  //reference point y-axis
  shapeSize=width/16; //all shapes have same width&height
  //increments
  stepY=-10;
  //start shapes
  noStroke();

  //shape #5

  //set location
  x1=x;
  x2=x+shapeSize;
  y1=y;
  y2=y+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  quad(x1, y1, x2, y1, x1, y2, x2, y2);

  //shape #6

  //change location
  x1=x+shapeSize/2;
  y1=y*3;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  circle(x1, y1, shapeSize);

  //shape #7

  //change location
  x1=x;
  y1=y*4+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));  
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  square(x1, y1, shapeSize);

  //shape #8

  //change location
  x1=x;
  x2=x+shapeSize;
  y2=y+height*6/8;
  y1=y2-shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  triangle(x1, y2, x2, y2, x+shapeSize/2, y1);

  //incremental motion
  //y=y+stepY;



  //draw bouncy ball
  stroke(255);
  fill(100, 68, 220);
  circle(a, b, r);

  //ball movement



  a=a+moveA;
  b=b+moveB; 

  //adding gravity
  //moveB=moveB+1;

  //wall detection
  if (a <= width/8 + r) {
    moveA = - moveA;
  }
  if (a >= width*7/8 - r) {
    moveA = - moveA;
  }
  if (b <= height/8 + r) {
    moveB = - (moveB);
  }
  if (b >= height*7/8 - r) {
    moveB = - (moveB);
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
