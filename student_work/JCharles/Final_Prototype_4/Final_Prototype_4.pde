PImage Balloon;
PVector pos, vel;

float rPosX, rPosY, cPosX, cPosY;
float rW, rH, cR;
float x, x1, y, y1;

void setup(){
  size (600, 600);
  background(color(16, 192, 245));
  Balloon = loadImage("Photo_Balloon.png");
  
  //placement of the hotair balloon
  pos = new PVector(200,100);
  vel = new PVector(2,1);
  pos.x = 200;
  
  //the actual balloon object
  //balloon = new Balloon();
  //balloon.pos = new PVector(200,100);
  //balloon.img = loadImage ("Photo_Balloon.jpg");
  //balloon.pos.x = 200;
  
  //pararemeters for rectangle
  rPosX = 0;
  rPosY = 400;
  rW = 10000;
  rH = 500;
  
  //parameters for circle
  cPosX = 300;
  cPosY = 300;
  cR = 100;
  
  //parameters for hot air ballon
  x = 50;
  y = 50;
 
  //parameters of a bus
  x1 = 10;
  y1 = 75;
  
}

void draw(){
  //grass on the floor with green coloring
  background(color(16, 192, 245));
  fill(#19AD16);
  rect(rPosX, rPosY, rW, rH);
  
  //drawing the balloon
  //balloon.illustrate();
  
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
  
  //radiating sun
  noStroke();
  fill(#FFFF00);
  ellipse(cPosX, cPosY-200, cR, cR);
  
  drawBus();
  
  //moving ballon that loops
  fill(128,233,0);
  noStroke();
  image(Balloon,x,y,cR,cR);
  //ellipse (x,y,cR,cR);
  x = x + 2;
  y = y + .002;
  if (x == 640){
    x=0;
  } 
}

void drawBus(){
  //Body of the bus
  fill(252, 233, 7);
  stroke(0);
  rect(x1,300,320,100);
  //Back wheel of the bus
  fill(0,0,0);
  ellipse(x1+60, cPosY+100, cR-55, cR-55);
  //Front wheel of the bus
  ellipse(x1+260, cPosY+100, cR-55, cR-55);
  //Top of the bus
  quad(x1,300,x1+20,280,x1+290,280,x1+320,300);
  //Windows
  fill(255,255,255);
  rect(x1+10,315,40,20);
  rect(x1+60,315,40,20);
  rect(x1+110,315,40,20);
  rect(x1+160,315,40,20);
  rect(x1+210,315,40,20);
  rect(x1+260,315,40,20);
  //Line
  line(x1,350,x1+320,350);
  
  //Stillwater School bus
  textSize(16);
  //font = loadFont("FFScala-32.vlw"); 
  //textFont(font); 
  fill(112, 117, 124);
  text("Fairy", x1+95, 365); 
  fill(112, 117, 124); 
  text("Magic", x1+135, 365); 
  fill(112, 117, 124); 
  text("Bus", x1+190, 365);
  
  //Door of the Stillwater School bus
  fill(128, 129, 130);
  rect(x1+293,355,20,40);
}
