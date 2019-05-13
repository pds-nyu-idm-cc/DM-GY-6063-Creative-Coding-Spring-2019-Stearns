class Tube {
  PImage light;
  PVector pos;
  PVector vel;
  float globalWidth = 25;
  float globalHeight = 50;
  float w= globalWidth;
  float h = globalHeight;
  Tube(float _x, float _y) {
    light=loadImage("light.png");
    pos = new PVector(_x, _y);
    vel = new PVector(-1, 0);
  }
  void move() {
    pos.add(vel);
  }
  void display() {
    rectMode(CENTER);
    light.resize(100, 0);
    //rect(pos.x, pos.y, w, h);
    image(light,pos.x,pos.y);
    //plane.resize(20, 0);
  }
  void setfill(color _c) {
    fill(_c);
  }
  boolean isNotActive() {
    return pos.x < -w/2;
  }
  boolean isHit(float _x, float _y) {
    float x1 = _x-w/2;
    float x2 = _x+w/2;
    float y1 = _y-h/2;
    float y2 = _y+h/2;
    float  r=dist(_x, _y, pos.x, pos.y);
    //return (pos.x > x1 && pos.x< x2) && ( pos.y > y1 && pos.y < y2);
    // return dist(x, y, _x, _y);
   return (pos.x > x1 && pos.x< x2) && ( pos.y > y1 && pos.y < y2)&& (r <= 100);
     //return;
    }
 
  }
