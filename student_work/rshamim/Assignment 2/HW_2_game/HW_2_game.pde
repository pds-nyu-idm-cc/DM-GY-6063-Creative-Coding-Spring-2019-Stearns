float x1 = 10;
float y1 = 100;
float x2 = 50;
float y2 = 110;
float ballx = 200;
float bally=0;
float ball2x= 400;
float ball2y=0;
float score =0;
float goal1x;
float goal2x;

void setup () {
  size (500, 500);
}

void draw (){
  background (14, 75, 39);
  stroke (0);
  
  
  //ball1
  circle (ballx, bally, 20);
  
  //ball motion
  if (keyPressed) {
    if (key == 'a') {
      ballx=ballx-1;  
    }
    
    if (key == 'w') {
      bally=bally-1;
    }
    if (key == 's') {
      bally=bally+1;
    }
    if (key =='d') {
      ballx=ballx+1;
    }
  }
  
  //ball2
  fill(73, 122, 196);
   circle (ball2x, ball2y, 20);
  
  //ball motion
  if (keyPressed) {
    if (key == 'j') {
      ball2x=ball2x-1;  
    }
    
    if (key == 'i') {
      ball2y=ball2y-1;
    }
    if (key == 'k') {
      ball2y=ball2y+1;
    }
    if (key =='l') {
      ball2x=ball2x+1;
    }
  }
  if (x1<width/2) {
    fill (68, 29, 192);
  }
  else {
    fill (191, 224, 68);
  }
  //moving triangle 
  triangle(x1, y1, 50,50 ,5,70);
  
  x1=x1+1;
  y1=y1+1;
  x2 = x2 +3;
  y2 = y2 -3;
  
  //basket
    stroke(91, 224, 68);
  fill(191, 224, 68);
  circle(250,250, 30);
  stroke (224, 163, 33);
  fill(224, 163, 33);
  circle (250, 250, 18);
  fill (229, 221, 86);
  circle(250, 250, 10);
  stroke(73, 122, 196);
  fill(73, 122, 196);
  triangle(250, 250, 200, 200, 200, 300
  );
  stroke(59, 100, 164);
  fill(59, 100, 164);
  triangle(250, 250, 200, 250, 250, 300);
  stroke(224, 59, 33);
  fill(224, 59, 33);
  triangle(250, 250, 300, 200, 300, 300); 
  stroke(220, 121, 90);
  fill(220, 121, 90);
  triangle(250, 250, 300, 250, 250, 200);
  
  stroke(229, 221, 86);
  fill(7229, 221, 86);
  circle(225, 225, 7);
   stroke(229, 221, 86);
  fill(229, 221, 86);
  circle(275, 225, 7);
  
  //define goal1
 // goal 
  
  //define goal2
  
  // reach goal increase score
  //if (ball
  
  
 
}
