// declare variables
float x,y;
float r = 15;
float speed1 = .05;
float angle1 = 0;
float speed2 = .011;
float angle2 = 0;
float originX;
float originY;
float dist = 200;
float amp = 100;
void setup(){

  // set screen size
  size(500, 500);
  
  // initialize variables
  originX=width/2;
  originY=height/2;
  
  // set starting background color
  background(255);
}

void draw(){
  
  // blank out canvas
  //background(255);
  
  // style our shape
  strokeWeight(1);
  stroke(0);
  fill(127);
  
  // update the motion
  x=originX+dist*cos(angle1);
  y=originY+dist*sin(angle1);
  angle1+=speed1;
  
  dist=amp*cos(angle2);
  angle2+=speed2;
  
  // draw shape
  // ellipse(x,y,2*r,2*r);
  point(x,y);
}
