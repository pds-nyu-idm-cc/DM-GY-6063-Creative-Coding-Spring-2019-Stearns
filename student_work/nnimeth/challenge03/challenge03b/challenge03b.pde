float x;
float y;

float easing = 0.05;

void setup(){

    size(400,400);   
    
}

void draw(){
    
  background(255);


  float circleX = mouseX; 
  float dx = circleX - x;
  x += dx * easing;
  
  float circleY = mouseY;
  float dy = circleY -y;
  y += dy * easing;


  noStroke();
  fill(255,0,0);
  ellipse(x,y, 35,35);
  


}
