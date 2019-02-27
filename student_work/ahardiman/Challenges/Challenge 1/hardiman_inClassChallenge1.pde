float x = 250;
float y = 250;

int value = 0;

void setup() {
  size(500,500);
  
}

void draw() {
 background(244,238,236);
 noStroke();
  
  //circle
  fill(value);
  circle(x,y,50);
  
}

void mouseMoved() {
  value = value +5;
  if (value > 255) {
    value = #51FF08;
  }
  
}
