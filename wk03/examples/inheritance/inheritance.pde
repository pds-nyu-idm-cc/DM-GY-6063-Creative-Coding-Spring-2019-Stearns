Player thePlayer;
Obstacle theObstacle;

void setup() {
  size(500, 500);
  frameRate(30);
  background(255);
  
  thePlayer = new Player();
  theObstacle = new Obstacle();
  
}

void draw() {
  
  background(255);
  
  // draw first
  thePlayer.render();
  theObstacle.render();
  
  // update second
  thePlayer.update();
  theObstacle.update();
  
  // scoring
  if(thePlayer.isInside(theObstacle)){
    thePlayer.score++;
    println("score! "+thePlayer.score);
  }
  
}

class GameObject {

  PVector pos;
  PVector vel;
  PVector acc;
  float size=50;
  float mass;
  boolean visible=true;
  float age;
  float lifespan;
  color sColor=color(0);
  color fColor=color(200,100,150);
  color tColor=(0);
  
  int edgeOption=1; // 0 = do nothing, 1 = wrap, 2 = bounce

  GameObject() {

    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
    acc = new PVector(0, 0);
    
  }

  void update() {

    vel.add(acc);
    pos.add(vel);
    acc.setMag(0);
    onEdgeCondition(edgeOption);
    
  }

  void applyForce(PVector _force) {

    // f=ma re written as a=f/m
    acc.add(_force.div(mass));
  }

  void render() {
    if (visible) {
      stroke(sColor);
      fill(fColor);
      ellipse(pos.x, pos.y, size, size);
    }
  }

  boolean isDead() {
    return age > lifespan;
  }

  boolean isInside(float _x, float _y) {
    return PVector.dist(pos, new PVector(_x, _y)) < size;
  }

  boolean isInside(PVector _loc) {
    return PVector.dist(pos, _loc) < size;
  }
  
  boolean isInside(GameObject _object) {
    return PVector.dist(pos, _object.pos) < size;
  }

  void onEdgeCondition(int _option) {
    switch (_option) {

    case 0: // do nothing
      break;

    case 1: // wrap around edges
      wrap();
      break;

    case 2: // bounce off edges
      bounce();
      break;

    default:
      println("Valid edge handling options: 0 = do nothing, 1 = wrap around, 2 = bounce");
      break;
    }
  }

  void wrap() {
    // wraps node around canvas
    pos.x=(pos.x+width)%width;
    pos.y=(pos.y+height)%height;
  }

  void bounce() {
    // detects collision with canvas edge
    // reverses the direction and speed
    
    if (pos.x-size/2 < 0 && vel.x < 0) {
      vel.x*=-1;
      pos.x=size/2;
    } else if (pos.x+size/2 > width && vel.x > 0) {
      vel.x*=-1;
      pos.x=width-size/2;
    }
    
    if (pos.y-size/2 < 0  && vel.y < 0) {
      vel.y*=-1;
      pos.y=size/2;
    } else if (pos.y+size/2 > height  && vel.y > 0) {
      vel.y*=-1;
      pos.y=height-size/2;
    }
  }
}

class Player extends GameObject {
  
  int score;
  
  Player() {
    super();
    super.edgeOption=2;
    super.fColor=color(200,100,150);
  }
  
  void render() {
    if (visible) {
      // ball
      stroke(sColor);
      fill(fColor);
      ellipse(pos.x, pos.y, size, size);
      
      // label
      textAlign(CENTER, CENTER);
      fill(tColor);
      text("Player",pos.x,pos.y);
    }
  }
  
}

class Obstacle extends GameObject {
  
  
  Obstacle() {
    super();
    super.fColor=color(100,200,150);
  }
  
  void render() {
    if (visible) {
      // square
      stroke(sColor);
      fill(fColor);
      rectMode(CENTER);
      rect(pos.x, pos.y, size, size);
      
      // label
      textAlign(CENTER, CENTER);
      fill(tColor);
      text("Obstacle",pos.x,pos.y);
    }
  }
}
