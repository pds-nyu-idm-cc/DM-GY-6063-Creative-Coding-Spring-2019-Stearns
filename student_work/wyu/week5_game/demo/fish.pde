class Fish {
  color clo;
  float x;
  float y;
  float r;
  float speed=0;
  //float speedy=0;
  float gravity=0.05;
  // float ran=-0.9;

  Fish(float ballx, float bally, float ballr) {
    clo =color (#f8b8c9);
    x= ballx;
    y= bally;
    r= ballr;
  }
  void move() { 
    speed += random(-gravity, gravity);
    //speedy += random(-gravity,gravity);
    y += speed;
    x += speed;
    if (x+r> width) { 
      x -=width;
    } 
    if (x-r< 0) { 
      x += width ;
      //speed *= ran;
    } 
    if (y + r > height) { 
      y -= height;
      //speed *= ran;
    } 
    if (y-r<0) { 
      y += height;
      //speed *= ran;
    }
  }
  void display() {
    ellipse(x, y, r*2, r*2);
    fill(clo);
  }
} 
