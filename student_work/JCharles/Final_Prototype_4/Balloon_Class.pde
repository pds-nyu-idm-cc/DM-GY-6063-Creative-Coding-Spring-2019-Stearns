class Balloon{
  PVector pos, vel;
  PImage img;
  //Balloon (PVector _p){
  //pos = p;
  //}
  void resetX(){
    pos.x=0;
}

void illustrate(){
  pushMatrix();
  translate(pos.x,pos.y);
  //rotate(frameCount/12.0);
  //translate(200,0);
  translate(0,sin(frameCount/12.0)*100);
  
  image(img,0,0,250,150);
  popMatrix();
  
  fill(255,0,0);
  ellipse(0,0,50,50);
  
  //pos.add(vel);
  println(pos);
  pos.x+=2;
  }
}
