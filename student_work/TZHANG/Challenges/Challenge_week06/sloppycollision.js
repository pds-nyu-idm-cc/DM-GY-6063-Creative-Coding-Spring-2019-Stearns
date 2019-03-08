var qty_balls=2;
Ball[] balls = new Ball[qty_balls];

function setup(){
  createCanvas(500, 500);
  background(255);
  
  for(var i =0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}


function draw(){
  background(255);

    balls[0].update(balls[1]);
    balls[1].update(balls[0]);
    balls[0].render();
    balls[1].render();
  }


class Ball {
  var pos;
  var vel;
  var r = 50;

  Ball() {
    pos = new var(random(width), random(height));
    vel = new var(random(-5, 5), random(-5, 5));
  }

  function update(Ball _b) {
    pos.add(vel);
    if(isOverLapping(_b)){
      _b.collide();
      this.collide();
    }
    bounce();
  }
  
  function render(){
    circle(pos.x,pos.y,2*r);
  }
  
  function collide(){
    vel.x=-vel.x;
    vel.y=-vel.y;
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