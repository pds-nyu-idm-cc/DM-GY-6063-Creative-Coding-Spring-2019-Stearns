PVector p1, p2;
PVector vel1, vel2;
float r = 30;

void setup (){
  size(500,500);
  background(0);
  p1 = new PVector(40, 20);
  p2 = new PVector(25, 50);
  
  vel1 = new PVector(5,3);
  vel2 = new PVector(-6,4);
}

void draw (){
  background(0);
  fill(255);
  circle(p1.x, p1.y, r);
  fill(0,0,255);
  circle(p2.x, p2.y, r);
  
  //movement
  p1.add(vel1);
  p2.add(vel2);
  
  //wall
  //ball1
  if(p1.x > width-r) {
    vel1.x=-vel1.x;
    p1.x=width-r;
  } else if (p1.x < 0+r) {
    vel1.x=-vel1.x;
    p1.x=0+r;
  }
  if (p1.y > height-r) {
    vel1.y=-vel1.y;
    p1.y=height-r;
  } else if (p1.y < 0+r) {
    vel1.y=-vel1.y;
    p1.y=0+r;
  }
  //ball2
    if(p2.x > width-r) {
    vel2.x=-vel2.x;
    p2.x=width-r;
  } else if (p2.x < 0+r) {
    vel2.x=-vel2.x;
    p2.x=0+r;
  }
  if (p2.y > height-r) {
    vel2.y=-vel2.y;
    p2.y=height-r;
  } else if (p2.y < 0+r) {
    vel2.y=-vel2.y;
    p2.y=0+r;
  }
}
