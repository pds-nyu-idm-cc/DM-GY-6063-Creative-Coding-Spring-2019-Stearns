class Zoog {
  //zoog's variables
  float xZoog, yZoog, wZoog, hZoog, eyeSize;
  
  //zoog constructor
  Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize) {
    xZoog = tempX;
    yZoog = tempY;
    wZoog = tempW;
    hZoog = tempH;
    eyeSize = tempEyeSize;
  }

  //move zoog
  void jiggle(float speed) {
    //change the location of zoog randomly
    xZoog = xZoog + random(-1,1)*speed;
    yZoog = yZoog + random(-1,1)*speed;
    
    //constrain zoog to window
    xZoog = constrain(xZoog, 0, width);
    yZoog = constrain(yZoog, 0, height);
  }
  
  void display() {
  ellipseMode(CENTER);
  //rectMode(CENTER);
  
  //zoog's body
  stroke(0);
  fill(random(200,500));
  rect(xZoog - wZoog/8, yZoog - hZoog/2, wZoog/4, hZoog);
  
  //zoog's head
  stroke(0);
  fill(255);
  ellipse(xZoog, yZoog - hZoog, wZoog, hZoog);
  
  //zoog's legs
  stroke(0);
  line(xZoog - wZoog/12, yZoog + hZoog/2, xZoog - wZoog/4, yZoog + hZoog/2 + 10);
  line(xZoog + wZoog/12, yZoog + hZoog/2, xZoog + wZoog/4, yZoog + hZoog/2 + 10);
  
  //zoog's eye change color accoridng to mouse location
  float dEye = dist(width/2, height/2, mouseX, mouseY);
  fill(dEye, dEye*2, dEye*2);
  ellipse(xZoog - wZoog/3, yZoog - hZoog, eyeSize, eyeSize*2);
  ellipse(xZoog + wZoog/3, yZoog - hZoog, eyeSize, eyeSize*2); 
  }
  
} 
