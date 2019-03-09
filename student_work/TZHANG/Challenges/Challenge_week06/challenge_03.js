Ball ball = new Ball();
var anchor = new var();

function setup() {
  createCanvas(500, 500);
  background(255);
}

function draw() {
  //background(255);
  
  var anchorForce = var.sub(ball.pos, anchor);
  anchorForce.setMag(1000/pow(var.dist(anchor, ball.pos), 2));
  ball.applyForce(anchorForce);
  ball.update();
  ball.render();

  circle(anchor.x, anchor.y, 25);
}

function mousePressed(){
  anchor.x=mouseX;
  anchor.y=mouseY;
}

class Ball {
  var pos;
  var vel;
  var acc;
  var r = 50;
  var m = 1;
  var dampening = 0.99;

  Ball() {
    pos = new var(random(width), random(height));
    vel = new var(random(-5, 5), random(-5, 5));
    acc = new var();
  }

  function update() {
    vel.add(acc);
    vel.mult(dampening);
    pos.add(vel);
    bounce();
    acc.setMag(0);
  }

  function render() {
    circle(pos.x, pos.y, 2*r);
  }

  function applyForce(var _force) {
    acc.add(_force.div(m));
  }

  function bounce() {
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

  var isOverLapping(Ball _b) {
    prvarln(pos);
    return var.dist(pos, _b.pos) < (_b.r+r);
  }
}