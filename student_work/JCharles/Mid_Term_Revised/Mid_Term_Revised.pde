PImage photo1;
PImage photo2;
PVector pos, vel;
Balloon balloon1;

float cPosX, cPosY;
float cR;

void setup(){
  size(800,800);
  photo1 = loadImage("Landscape.jpg");
  photo2 = loadImage("Photo_Balloon.png");
  
  cPosX = 300;
  cPosY = 300;
  cR = 100;
  
  pos = new PVector(200,100);
  vel = new PVector(2,1);
  pos.x = 200;
  
  balloon1 = new Balloon();
  balloon1.pos = new PVector(200,100);
  balloon1.photo2 = loadImage("Photo_Balloon.png");
  balloon1.pos.x = 200;
  
}

void draw(){
  image(photo1,0,0);
  photo1.resize(800,800);
  //image(photo2,0,0);
  //photo2.resize(65,65);
  
  //cloud 1
  noStroke();
  fill(255,255,255);
  ellipse(cPosX -200, cPosY -240, cR -40, cR -40);
  ellipse(cPosX -155, cPosY -240, cR -10, cR -20);
  ellipse(cPosX -110, cPosY -240, cR -42, cR -42);
  
  //cloud 2
  noStroke();
  ellipse(cPosX +100, cPosY -240, cR -40, cR -40);
  ellipse(cPosX +145, cPosY -240, cR -10, cR -20);
  ellipse(cPosX +190, cPosY -240, cR -42, cR -42);
  
  balloon1.illustrate();
}
