// declare variables

float x, y, r=15, stepX, stepY;

void setup(){

  // set screen size
  size(500, 500);
  
  // initialize variables
  x=width/2;
  y=height/2;
  // how much we increment the coordinates by
  stepX=-10;
  stepY=0;
  
  // set starting background color
  background(255);
}

void draw(){
  
  // blank out canvas
  background(255);
  
  // style our shape
  strokeWeight(1);
  stroke(0);
  fill(127);
  
  // draw shape
  ellipse(x,y,2*r,2*r);
  
  // incremental motion
  x=x+stepX;
  y=y+stepY;
  
  // wrap around math(s)
  x=(x+width) % width;
  y=(y+height) % height;
  
  // drunk walk
  //stepX=random(-5,5);
  //stepY=random(-5,5);
  
  println("X: "+x+", Y: "+y);
}
