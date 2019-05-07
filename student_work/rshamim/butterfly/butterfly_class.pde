class Butterfly {
  PVector pos;
  PVector vel;
  PImage img;
  

  // constructor -- runs whenever a new class is initialized
  // the stuff in the parentheses are called parameters
  Butterfly (PVector posIn){
    //println(random ({1,2,3,4});
    img = loadImage("butterfly_img"+int (random(1,5))+".png");
    pos= posIn;
    vel = new PVector (random(-2, 3), random(-2,3));
       
  }
  //constructor when image is specified
  Butterfly (PImage imgIn, PVector posIn){
    img = imgIn;
    pos = posIn;

    
  }
  
  void update (){
  pos.add(vel);
  pos.x+=(sin(frameCount)/2.);
  println(sin(frameCount));
 // pos.y+=sin(frameCount/r+r);
  if (pos.x<0){
    pos.x = width;
  }
   if (pos.x>width){
    pos.x = 0;
   }
    if (pos.y<0){
    pos.y = height;
    }
    if (pos.x>height){
    pos.x = 0;
  }
  //vel.mult(0.98);
  }
  
  void draw(){
    pushMatrix();
  translate( pos.x, pos.y);
  rotate (posPercentage/100.);
  translate (1, 0);
  
  image(img,0,0, 70,70);
  popMatrix();
  }
}
