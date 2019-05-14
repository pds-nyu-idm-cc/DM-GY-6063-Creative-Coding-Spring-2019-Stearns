class moveforward {
  PVector pos, vel;
  PImage img;

  moveforward() {

    pos = new PVector(0, 0);
      vel = new PVector(2, 1);
  }

void set() {
  //drawBackground();
  
  for(int i =0; i<30; i++)
   image(img, pos.x+i, pos.y-i);
   
   for(int i =0; i<30; i++)
   image(img, pos.x-i, pos.y+i);
   
   
   //x+=(scale *num sin) noise(n1+=0.01)

}

  void draw() {
 
    pushMatrix();
    translate(0, sin(frameCount/18.)*2);
    image(img, pos.x, pos.y);
    popMatrix();
  

  }
}
