float r,g,b;
boolean state = false;

void setup(){
  background(51);
  size(600,600);
}

void draw(){
    update();
    ellipse(300, 300, 150, 150);
}

void update(){
  if(mouseX > 225 && mouseX < 375 && mouseY > 225 && mouseY < 375){
    r = 0;
    g = 255;
    b = 0;
    fill(r,g,b);
    if(mousePressed){
      r = 0;
      g = 0;
      b = 255;
      fill(r,g,b);
    }
  }
  else{
    fill(255,0,0);
  }
}
