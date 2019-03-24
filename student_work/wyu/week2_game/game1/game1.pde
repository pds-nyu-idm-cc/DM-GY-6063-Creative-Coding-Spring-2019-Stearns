float circleX=0;
float circleColor = 0;
float circleX2=500;
float speedX=5;
float speedX2=-5;
float Y;
float space = 50;

void setup() {
  size(500, 500);
  background(59);
}

void draw() {
  

  //background art
  space = space + random(-4, 4);
  
  //for loop
  for (float X=0; X<width; X=(X+space)) {
    line(X, 0, X, height);
  }

  //first round shape
  circleColor = circleColor + 1;
  stroke(100);
  fill(circleColor);
  ellipse( circleX, 50, 50, 50); 


  // the motion object1
  circleX = circleX + speedX;

  //if statement
  if (circleX > (width/2-25)) {
    speedX=-5;
  } 
  if (circleX < 0) {
    speedX= 5;
  }

  //second round shape
  stroke(100);
  fill(circleColor);
  ellipse(circleX2, 50, 50, 50);
  // the motion object2
  circleX2 = circleX2 + speedX2;

  //if statement
  if (circleX2 < (width/2+25)) {
    speedX2=5;
  } 
  if (circleX2 > 500) {
    speedX2=-5;
  }
}

void keyPressed () {
  //user input
  background(random(0, 255), random(0, 255), random(0, 255), 170);
}
