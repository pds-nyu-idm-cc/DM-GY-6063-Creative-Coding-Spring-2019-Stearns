//Recreating "Composition with Red, Blue and Yellow" (1930) by Piet Mondrian
//by Jude Zhu
HLine h1 = new HLine(20, 2.0); 
HLine h2 = new HLine(50, 2.5); 

void setup(){
  size(500,500);
  smooth();
  strokeWeight(10);
  stroke(0);
  frameRate(30);
}

void draw(){
  background(223, 227, 226);
  
  //circle
  int level = int( map(mouseX, 0,width, 0,10) );  // int() because of type conversion
  drawCircle(width/2, height/2, level);
  
  //lines
  h1.update(); 
  h2.update(); 
  
  //red square
  rectMode(CENTER);
  fill(210, 23, 36);
  rect(mouseX, mouseY,300,300);
  
  //blue square
  rectMode(CORNER);
  fill(9,76,149);
  rect(0, mouseY+150, width-mouseX+50, height-mouseY+50);
  rect(mouseX+150, 0, width, height-mouseY);
  
  //yellow square
  rectMode(CORNER);
  fill(245,208,47);
  rect(0,0,mouseX-150,mouseY-150);
  rect(mouseX+75, mouseY+150,width,height);
  
  //stroke
  stroke(0);
  line(0,mouseY,mouseX-150,mouseY);  
}

class HLine { 
  float ypos, speed; 
  HLine (float y, float s) {  
    ypos = y; 
    speed = s; 
  } 
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    line(0, ypos, width, ypos); 
  } 
} 

// the recursive function
void drawCircle(int x, int radius, int level) {                    
  ellipse(x, height/2, radius, radius);
  fill(255);
  if(level > 0) {  // to stop infinite recursion
    drawCircle(x - radius/2, radius/2, level-1);
    drawCircle(x + radius/2, radius/2, level-1);
  }
}
