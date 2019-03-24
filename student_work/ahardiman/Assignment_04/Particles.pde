class Particle {
 float x, y;
 float l;
 
 Particle() {
   x = random(width);
   y = random(height);
   l = random(10,20);
}

  Particle(float tempX, float tempY, float tempL) {
   x = tempX;
   y = tempY;
   l = tempL;
  }
  
  boolean overlaps(Particle other) {
    float d = dist(x,y,other.x,other.y);
    if (d < l) 
      {
      return true;
    } else {
      return false;
    
    }
  }
  
  void display() {
    fill(39,67,47);
    noStroke();
    square(x,y,l);
    ellipse(width/2,height/2,50,50);
  }
  
}
