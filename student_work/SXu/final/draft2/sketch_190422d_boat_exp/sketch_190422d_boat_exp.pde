//PImage img;
//PVector pos, vel;
boat b1;

void setup() {

  size(800, 800);
  //pos = new PVector(200, 100);
  //vel = new PVector(2, 1);


  b1 = new boat(); 
  b1.pos = new PVector(300, 200);
  b1.img = loadImage("boat.png");  
  b1.pos.x=200;


  //img = loadImage("boat.png");
  //surface.setSize(img.width, img.height);
  imageMode(CENTER);
}

void draw() {
  //background(0);
//  fill(0,0.01);

  rect(0,0,width,height);
b1.draw();


}
