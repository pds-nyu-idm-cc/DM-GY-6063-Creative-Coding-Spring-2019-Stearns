int qty_balls=2;
Ball[] balls = new Ball[qty_balls];

void setup(){
  size(500, 500);
  background(255);
  
  for(int i =0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}


void draw(){
  background(255);

    balls[0].update(balls[1]);
    balls[1].update(balls[0]);
    balls[0].render();
    balls[1].render();
  }


class Ball {
  PVector pos;
  PVector vel;
  float r = 50;

  Ball() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
  }

  void update(Ball _b) {
    pos.add(vel);
    if(isOverLapping(_b)){
      _b.collide();
      this.collide();
    }
    bounce();
  }
  
  void render(){
    circle(pos.x,pos.y,2*r);
  }
  
  void collide(){
    vel.x=-vel.x;
    vel.y=-vel.y;
  }

  void bounce() {
    if ( pos.x > width-r) {
      pos.x=width-r;
      vel.x=-vel.x;
    }
    if ( pos.x < r) {
      pos.x=r;
      vel.x=-vel.x;
    }
    if ( pos.y > height-r) {
      pos.y=height-r;
      vel.y=-vel.y;
    }
    if ( pos.y < r) {
      pos.y=r;
      vel.y=-vel.y;
    }
  }

  boolean isOverLapping(Ball _b) {
    println(pos);
    return PVector.dist(pos, _b.pos) < (_b.r+r);
  }
}
