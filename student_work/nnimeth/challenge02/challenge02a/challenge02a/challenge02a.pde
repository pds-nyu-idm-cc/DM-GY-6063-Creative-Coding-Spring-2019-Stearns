

float x = 150;
float y = 100;
float xspeed = 5;
float yspeed = 4;

void setup(){

    size(400,400);
    
}


void draw(){
  
  background(255);
  noStroke();
  fill(255,0,0);
  ellipse(x, y, 35,35);
  
  x += xspeed;
  y += yspeed;
  
  if (x< 0 || x> width){
    xspeed *= -1;
  }
  
  if( y < 0 || y > height){
    yspeed *= -1;
  }
  

}
