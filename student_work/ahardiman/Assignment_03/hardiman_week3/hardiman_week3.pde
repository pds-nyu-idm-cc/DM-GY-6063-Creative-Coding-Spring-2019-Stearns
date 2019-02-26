//float[] bubbles_posX = {50,125,200,275,350,425};
//float[] bubbles_posY = {450};

/*
item#  x    y
------------
0      50   450
1      125
2      200
3      275
4      350
5      425
*/



// 1st circle
float circleX = 50;
float circleY = 450;

// 2nd circle
float circleA = 125;
float circleB = 450;

// 3rd circle
float circleC = 200;
float circleD = 450;

// 4th circle
float circleE = 275;
float circleF = 450;

// 5th circle
float circleG = 350;
float circleH = 450;

//6th circle
float circleI = 425;
float circleJ = 450;

//score
int totalscore = 0;



void setup(){
  size(500, 500);
 
}

void draw(){
  background(244,238,236);
  noStroke();
  
  // 1st circle
  fill(255,97,56);
  circle(circleX,circleY,50);
    circleY = circleY - 1;
    
  // 2nd circle
  fill(255,255,157);
  circle(circleA,circleB,40);
    circleB = circleB - 2;
  
  // 3rd circle
  fill(190,235,159);
  circle(circleC,circleD,30);
    circleD = circleD - 0.75;
  
  // 4th circle
  fill(121,189,143);
  circle(circleE,circleF,50);
    circleF = circleF - 2.5;
  
  // 5th circle
  fill(0,163,136);
  circle(circleG,circleH,35);
    circleH = circleH - 3;
  
  //6th circle
  fill(255,97,56);
  circle(circleI,circleJ,50);
    circleJ = circleJ - 1.5;
    
   //score
    fill(113,1,1);
    textSize (15);
    text("Score",10,20);
    text(totalscore,10,40);
}
  

void mousePressed() {
  
  //circles clicked = score increasing
  
  float a = dist(circleX,circleY,mouseX,mouseY);
  
  if (a <= 20) {
    totalscore = totalscore + 1;

  }
  
  float b = dist(circleA,circleB,mouseX,mouseY);
  
  if (b <= 20) {
    totalscore = totalscore + 1;
  }
  
  float c = dist(circleC,circleD,mouseX,mouseY);
  
  if (c <= 20) {
    totalscore = totalscore + 1;
  }
  
  float d = dist(circleE,circleF,mouseX,mouseY);
  
  if (d <= 20) {
    totalscore = totalscore + 1;
  }
  
  float e = dist(circleG,circleH,mouseX,mouseY);
  
  if (e <= 20) {
    totalscore = totalscore + 1;
  }
  
   float f = dist(circleI,circleJ,mouseX,mouseY);
  
  if (f <= 20) {
    totalscore = totalscore + 1;
    
  }
}
  
  
void mouseReleased(){
  
  //win
  if (totalscore >= 5) {
    noLoop();
    background(244,238,236);
    textSize(18);
    text("You win!", 215, height/2);
  } else if (totalscore >=5) {
    noLoop();
    background(244,238,236);
    textSize(18);
    text("Oh no.. Try again", 175, height/2);
  }
}
