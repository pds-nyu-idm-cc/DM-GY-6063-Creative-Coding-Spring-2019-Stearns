class Butterfly {
  PVector pos;
  PImage img;

  // constructor -- runs whenever a new class is initialized
  // the stuff in the parentheses are called parameters
  Butterfly (PVector posIn){
    img = loadImage("butterfly.png");
    pos= posIn;
  }
  //constructor when image is specified
  Butterfly (PImage imgIn, PVector posIn){
    img = imgIn;
    pos = posIn;
  }
  
  void draw(){
    pushMatrix();
  translate( pos.x, pos.y);
  rotate (posPercentage/5.0);
  translate (1, 0);
  
  image(img,0,0, 200,200);
  popMatrix();
  }
}
