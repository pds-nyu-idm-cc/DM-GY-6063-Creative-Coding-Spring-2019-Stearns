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
  circle(p2.x, p2.y, r);
  
  //movement
  p1.add(vel1);
  p2.add(vel2);
  
  //wall
  //ball1
  if(p1.x > width) {
    vel1.x=-vel1.x;
    p1.x=width;
  } else if (p1.x < 0) {
    vel1.x=-vel1.x;
    p1.x=0;
  }
  if (p1.y > height) {
    vel1.y=-vel1.y;
    p1.y=height;
  } else if (p1.y < 0) {
    vel1.y=-vel1.y;
    p1.y=0;
  }
  //ball2
    if(p2.x > width) {
    vel2.x=-vel2.x;
    p2.x=width;
  } else if (p2.x < 0) {
    vel2.x=-vel2.x;
    p2.x=0;
  }
  if (p2.y > height) {
    vel2.y=-vel2.y;
    p2.y=height;
  } else if (p2.y < 0) {
    vel2.y=-vel2.y;
    p2.y=0;
  }
}
