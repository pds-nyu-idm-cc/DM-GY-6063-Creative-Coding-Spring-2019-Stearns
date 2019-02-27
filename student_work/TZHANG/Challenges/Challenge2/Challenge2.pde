//just started on this, not yet finished. Very basic.
class Ball{
   PVector position;
   PVector velocity;
   float radius;
   
   Ball(float x, float y){
     position = new PVector(x,y);
  }
  
  void wallCollision(){
  }
  
  void ballCollision(){
  }
  
  void bounce(){
  } 
}

Ball[] balls =  { 
  new Ball(100, 400), 
  new Ball(700, 400) 
};

void setup() {
  size(600,600);
}

void draw() {
  background(0,0,0);
}
