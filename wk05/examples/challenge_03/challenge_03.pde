Ball ball = new Ball();
PVector anchor = new PVector();

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  //background(255);
  
  PVector anchorForce = PVector.sub(ball.pos, anchor);
  anchorForce.setMag(1000/pow(PVector.dist(anchor, ball.pos), 2));
  ball.applyForce(anchorForce);
  ball.update();
  ball.render();

  circle(anchor.x, anchor.y, 25);
}

void mousePressed(){
  anchor.x=mouseX;
  anchor.y=mouseY;
}

class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 50;
  float m = 1;
  float dampening = 0.99;

  Ball() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
    acc = new PVector();
  }

  void update() {
    vel.add(acc);
    vel.mult(dampening);
    pos.add(vel);
    bounce();
    acc.setMag(0);
  }

  void render() {
    circle(pos.x, pos.y, 2*r);
  }

  void applyForce(PVector _force) {
    acc.add(_force.div(m));
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
