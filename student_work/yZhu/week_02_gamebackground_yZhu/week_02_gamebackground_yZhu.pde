float r;
float g;
float a;
float b;

float diam;
float xcircle;
float ycircle;

float xball = 100;
float yball = 200;
float ballspeed = 1;
float gravity = 0.1;

void setup(){
  size(500,800);
  frameRate(30);
}
// background art
void draw(){
  background(255);
  
  //colorful circles
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(50);
  xcircle=random(width);
  ycircle=random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(xcircle,ycircle,diam,diam);
  
 //background change sky color
 //start with i as 0
  int i = 0;
  //while i is less than the width of the window
  while (i < width){
    noStroke();
    float distance = abs(mouseX- i);
    fill(distance, 25,95);
    rect(i,0,10,height);
    //increase i by 10
    i+=10;
  }
 
  //main character
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //BODY, change color
  stroke(0);
  fill(mouseX,mouseY,mouseY-mouseX);
  rect(mouseX,mouseY,20,100);
  
  //HEAD
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  //eye, change color
  fill(mouseX-50,0,mouseY-50);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  //leg, move with flow
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);

  //aliens
  int w=80;
  int h=90;
  int speedalien=2;
    
    int yalien = height/5;
    //multiple versions of spaceship
    for (int xalien = 100; xalien < width; xalien += 100){
      
      //change x location of aliens by speed----------I don't know why but this is now working!!!
    xalien = xalien + speedalien;
    
    //if slien has reached an edge, reverse speed
    if ((xalien > width) || (xalien < 0)){
      speedalien = speedalien * -1;
    }
      
      //draw alien
      stroke(0);
      fill(255);
      ellipse(xalien,yalien,w/1,h*0.5);
      ellipse(xalien-20,yalien,20,20);
      ellipse(xalien+20,yalien,20,20);
      triangle(xalien-5,yalien,xalien+5,yalien,xalien,yalien+10);
    }
   
    //draw the ball
    fill(255);
    stroke(0);
    ellipse(xball,yball,50,50);
    xball=xball+ballspeed;
    yball=yball+ballspeed;
    ballspeed = ballspeed + gravity;
    
    //bounce back
    if (xball > width){
      ballspeed = ballspeed * -0.85;
      xball = width;
    }
    if (yball > height) {
      ballspeed = ballspeed * -0.95;
      yball = height;
    }
}

  
