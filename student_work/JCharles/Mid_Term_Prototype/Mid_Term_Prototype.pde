//Origin stays fixed!
float oX = 100;
float oY = 100;
//present location
float x = oX;
float y = oY;
//dimensions
float w = 20;
float h = 25;
color fC= color (0);
color hC= color (127);
color cC= color (255);

void setup(){
  size(500,500);
}

void draw(){
  if (onHover()){
    fill(hC);
    if(mousePressed){
      fill(cC);
    }
  }else {
    fill(fC);
  }
  //isClicked();
  rect(x,y,w,h);
}

boolean onHover(){
  return mouseX > x && mouseX < x + w && mouseY > Y && mouseY < y + h;
}
