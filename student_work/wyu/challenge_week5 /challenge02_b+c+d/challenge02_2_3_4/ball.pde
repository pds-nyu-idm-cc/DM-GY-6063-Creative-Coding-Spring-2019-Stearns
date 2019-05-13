
class Ball {
  PVector location; 
  PVector velocity;  
  float r;
  float d;
  Ball(float x, float y) {
    r = 50;
    location = new PVector (x,y);
    velocity = new PVector (3,1);
  }

  void display() {
    ellipse(location.x, location.y, r, r);
  }

  void update() {
     location.add(velocity);
  }
  void collision() {
    //the collision of wall
    if ((location.x > width-r/2) || (location.x< r/2)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height-r/2) || (location.y< r/2)) {
      velocity.y = velocity.y * -1; 
      
    }
  }
  void ballCollision(float x, float y){
     d = dist(location.x,location.y, x, y);
     if (d <= r){
      velocity.x = velocity.x * -1;
      velocity.y = velocity.y * -1; 
     }
  
  }
}
