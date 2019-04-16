boolean bounce = false;
char score = 'a';
float circleBallX = 50;
float xspeed = 3.567;

void setup(){
  size(414,736);
}

void draw (){
  background(255);
  fill(150);
  stroke(15);
  ellipse(circleBallX, 150, 15,15);
  //Magic Rectangle
  //rect(20,40,375,645,7);
  
  
  if (circleBallX > width || circleBallX < 0){
    xspeed = xspeed * -1;
  }
  
  if (bounce) {
    circleBallX = circleBallX + xspeed;
  }
  
  for (int x = 0; x < width; x = x + 20){
  rect(x, 0, 20, 20);
}
for (int y = 0; y < height; y = y + 20){
  rect(0, y, 20, 20);
}
}



void mousePressed(){
  bounce = !bounce;
}
