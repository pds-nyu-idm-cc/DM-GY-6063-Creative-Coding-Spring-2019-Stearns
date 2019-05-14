class Button {
  float x, y, r;
  color c;
  
  Button(float _x, float _y, float _r, color _c) {
    x = _x;
    y = _y;
    r = _r;
    c = _c;
  }
  
  void display() {
    noStroke();
    fill(c);
    circle(x,y,r);
  }

  
  void update() {
    if (dist(x,y,mouseX,mouseY)<r){
      x = random(0,width);
      y = random(0,height);
      c = color (random(255), random(255), random(255));
      r = random(30,50);
    }
  }
  
}
