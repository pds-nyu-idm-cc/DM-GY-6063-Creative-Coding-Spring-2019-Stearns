void setup(){
  //UIKit Size for iPhone 7 Plus
  size(414,736);
  background(255);
  stroke(15);
  fill(150);
  //Augmented Reality Magic Rectangle
  rect(20,40,375,645,7);
  //home button
  ellipse(207,710,35,35);
  fill(35);
  //UI experience 1
  ellipse (105,165,85,85);
  //UI experience 2
  ellipse (305,165,85,85);
  //UI experience 3
  ellipse (105,500,85,85);
  //UI experience 4
  ellipse (305,500,85,85);
}

void draw(){
  //translate(40,20);
  //rotate(0.5);
  //scale(1.5);
  //ellipse(50,50,60,60);
  //strokeWeight(4);
  //fill(128);
  //rect(50,50,40,30);
  //rectMode(CENTER);
  //rect(mouseX, mouseY, 50, 50);
}
void mousePressed(){
  background(255);
  ellipse (305,500,85,85);
}
 
