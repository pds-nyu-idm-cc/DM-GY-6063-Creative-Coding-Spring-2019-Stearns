class Circle {
  float x, y;
  PVector pos, vel, acc;
  color c;

  Circle(PVector _p, PVector _v) {
    pos = _p;
    vel = _v;
    acc = new PVector (0, 0);

    c = color(random(255), random(255), random(255));
  }

  void update() {
    acc.y=(random(-1,1));
    vel.add(acc);
    pos.add(vel);
    vel.mult(0.99);
    
    //add sine wave movement to circle when certain drum beat is detected
    //and change direct on the other axis
    if (detector.isSnare()){
      vel.add(new PVector(0,cos(frameCount/10.)));
      vel.x=-vel.x;
    } else if (detector.isKick()){
      vel.y=-vel.y;
      vel.add(new PVector(sin(frameCount/10.),0));
    }
    
    //wall detection
    if (pos.x>width-r){
      vel.x=-vel.x;
      pos.x=width-r;
    }
    if (pos.x<0+r){
      vel.x=-vel.x;
      pos.x=0+r;
    }
    if (pos.y>height-r){
      vel.y=-vel.y;
      pos.y=height-r;
    }
    if (pos.y<0+r){
      vel.y=-vel.y;
      pos.y=0+r;
    }
    
  }

  void render() {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
