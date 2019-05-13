int circleX, circleY;
int circleSize = 90;
int rectX, rectY;
int rectSize = 100;

color circleColor, baseColor;
color circleHighlight;
color currentColor;

boolean circleOver = false;

void setup(){
  circleX = width/2 + circleSize/2 + 10;
  circleY = height/2;
  rectX = 90;
  rectY = 90;
  
  circleColor = color(255);
  baseColor = color(102);
  circleHighlight = color(204);
  currentColor = baseColor;
  
  ellipseMode(CENTER);

  //UIKit Size for iPhone 7 Plus
  size(414,736);
  
  background(255);
  stroke(15);
  fill(150);
  
  //Augmented Reality Magic Rectangle
  rect(rectX-70, rectY-50, rectSize*3 + 75, rectSize*6 +45, rectSize-93);
  
  //home button
  fill(150);
  noStroke();
  ellipse(circleX-55, circleY+342, circleSize-55, circleSize-55);
  
  //Bottom Button on right-side
  fill(0);
  noStroke();
  ellipse(circleX+50, circleY+203, circleSize-10, circleSize-10);
  
  //Bottom Button on left-size
  fill(0);
  noStroke();
  ellipse (circleX-150, circleY+203, circleSize-10, circleSize-10);
  
  //Top Button on the right-side
  fill(0);
  noStroke();
  ellipse (circleX+50, circleY-175, circleSize-10, circleSize-10);
  
  //Top Button on the left-size
  fill(0);
  noStroke();
  ellipse (circleX-150, circleY-175, circleSize-10, circleSize-10);
}

void draw(){}

void mousePressed(){}
