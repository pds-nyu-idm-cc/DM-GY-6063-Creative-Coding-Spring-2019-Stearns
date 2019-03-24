
int anInt = 0;
float aFloat = 0.0;
boolean aBool = true;
char aCharacter = 'a';

color c = 0xFF551033; // 0-FF = 0-255 this one is "eggplant"
color roof = color(127,64,15);

color textColor = color(255);

void setup(){
  size(200,200);
  background(c);
  noLoop();
}

void draw(){
  background(c);
  fill(textColor);
  textAlign(CENTER,CENTER);
  text((frameCount % 16)+1, width/2, height/2);
  text(frameCount , width/2, (height/2)-20);
}

void keyPressed(){
  redraw();
}
