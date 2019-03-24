float x, y;
float easing = 1.2;

float ex,ey,xspeed, yspeed;

void setup(){
  size (300,300);
}

void draw(){
  background (255);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x = dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y = dy * easing;
  
  
  
  fill(0);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
  
  fill (255,0,0);
  noStroke();
  ex=width/2;
  ey=height/2;
  ellipse(ex, ey, 100, 100);
  xspeed = 2;
  yspeed = 2;
  ex = ex + xspeed;
  ey = ey + yspeed;
  
  
  //ok still thinking about the moving of the red circle!
  
  float d = dist(mouseX, mouseY, ex, ey);
  if (d <= 75){
   xspeed = -xspeed;
   yspeed = -yspeed;
  }
}
