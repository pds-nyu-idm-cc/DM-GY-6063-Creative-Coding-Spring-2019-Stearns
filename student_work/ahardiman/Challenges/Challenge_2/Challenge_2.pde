float x = 200;
float y = 200;

float a = 100;
float b = 100;

void setup() {
  size(500,500);
  
}

void draw() {
 background(244,238,236);
 noStroke();
  
  //circle 1
  fill(255,0,0);
  circle(x,y,50);
  x = x+1;
  if(x > width-20){
    x = 20;
  }
  
  fill(0);
  circle(a,b,60);
  b = b+1;
  if(b > height-20){
    b = 20;
  }
  
}
