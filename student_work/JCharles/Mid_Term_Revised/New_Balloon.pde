class Balloon{
  PVector pos, vel;
  PImage photo2;
  
  void resetX(){
  
}

void illustrate(){
  pushMatrix();
  translate(pos.x, pos.y);
  translate(0,sin(frameCount/12.0)*100);
  
  image(photo2,0,0,250,150);
  popMatrix();
  
  fill(255,0,0);
  ellipse(0,0,50,50);
  
  pos.x+=2;
  }
}
