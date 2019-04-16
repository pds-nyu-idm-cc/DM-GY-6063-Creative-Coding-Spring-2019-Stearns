boolean going = false;
float x = 20;

void setup(){
  size(400,300);
}

void draw() {
  background(0);
  fill(255);
  
  ellipse(x, 150, 24, 24);
  if (going){
    x = x + 2;  
  }
}

void mousePressed(){
  going = !going;
}
