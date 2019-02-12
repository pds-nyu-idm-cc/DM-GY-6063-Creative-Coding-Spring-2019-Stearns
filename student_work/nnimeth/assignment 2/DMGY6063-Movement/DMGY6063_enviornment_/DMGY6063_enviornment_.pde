//moving circle
int x, y, w, h, speedX, speedY;

void setup(){

  size(840,620);
  background(255);
 
  noStroke();
  
  // red circle 
  x = width/2;
  y = height/2;
  w = 70;
  h = 70;
  speedX = 2;
  speedY = 3;
 
  }
 
void draw(){
    
  //opacity (fading it in and out)
  fill(0,30);
  rect(0,0,width, height);
  
  //star bg circle color & location
  fill(255);
  ellipse(random(width), random(height), 6, 6);
  
  //moving red circle
  drawCircle();
  moveCircle();
  bounceOff();
  
  }
   
 
  void drawCircle(){
  
    fill(255,0,0);
    ellipse(x,y,w,h);
  }
  
  void moveCircle(){
  
    x = x + speedX;
    y = y + speedY;
  
  }
  
  void bounceOff(){
  
    if (x > width - w/2) {
      speedX = -speedX;
     } else if ( x < 0 + w/2){
       speedX = -speedX;
     }
     
    if ( y > height - w/2){
      speedY = -speedY;
    } else if ( y < 0 + w/2){
      speedY = -speedY;
    } 
  
  }
  
