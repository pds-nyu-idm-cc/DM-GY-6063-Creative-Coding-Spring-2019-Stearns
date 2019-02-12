float x=25;
float y;
float speedX=5;
float speedX2=5;
float space=50;


void setup() {
  size(500, 500);
  background(100);
}

void draw() {
  //background art
  space = space + random(-4, 4);

  //for loop
  for (float linex=0; linex<width; linex=(linex+space)) {
    line(linex, 0, linex, height);
  }

  //the object
  stroke(255);
  rectMode(CENTER);
  rect(x, y, 50, 50);
  y=y+speedX;

  //if statement
  if (y> (height-25)) {
    x=x+speedX;
    y=height-25;
  } 
  if (x> (height-25)) {
    speedX=-5;
    x=height-25;
  }
  //if ( x<=height-25 && y<25) {
  //speedX=0 ;
  //x=x-speedX2;
  //}
  //don't know how to put the object back to origin
}
void keyPressed () {

  //user input
  background(random(0, 255), random(0, 255), random(0, 255), 170);
}
