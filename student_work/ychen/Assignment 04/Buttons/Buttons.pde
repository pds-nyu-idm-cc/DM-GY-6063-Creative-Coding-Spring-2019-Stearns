
//everytime you click the center "button" the cicrles stop one at a time

int total = 10;

float[] ballX;
float[] ballY;
float[] ballR;
float[] ballSpeedX;
float[] ballSpeedY;
color[] ballColor;

void setup() {
  size (500, 500);
  background (255);
  //frameRate (10);

  ballX = new float[total];
  ballY = new float[total];
  ballR = new float[total];
  ballSpeedX = new float[total];
  ballSpeedY = new float[total];
  ballColor = new color[total];

  for (int i = 0; i < total; i++) {
    ballX[i]=random(width);
    ballY[i]=random(height);
    ballR[i]=random(25, 30); 
    ballSpeedX[i]=random(-2, 3.5);
    ballSpeedY[i]=random(-2, 3.5);
    ballColor[i]= color(random(100, 200), random(100, 200), random(100, 200));
  }
}

void draw() {  
  //square "button", center
  square();
  
  //fade area, center
  noStroke();
  fill(255, 5);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);  

  //circles
  for (int i = 0; i < total; i++) {

    // update the position by adding speed
    ballX[i]+=ballSpeedX[i];
    ballY[i]+=ballSpeedY[i];

    //ballSpeedX[i] = -ballSpeedX[i];
    //ballSpeedY[i] = -ballSpeedY[i];    

    //wrap the position around the canvas
    ballX[i]=(ballX[i]+width)%width;
    ballY[i]=(ballY[i]+height)%height;

    //draw the ball
    noStroke();
    fill(ballColor[i]);
    ellipse(ballX[i], ballY[i], 2*ballR[i], 2*ballR[i]);
  }
}

void square() {
  stroke(51);
  strokeWeight(20);
  noFill();
  rectMode(CENTER);
  rect (width/2, height/2, 100, 100);
    
  //color rectColor = color (51);
  //if (mousePressed == true){
  //  fill (rectColor);
  //}else{
  //  noFill();
  //}

  ////tried to make a hightlight color when mouse position over it
  color rectColor = color (51);
  if (mouseX >= (width/2 - 50) && mouseX <= (width/2 + 50) && 
    mouseY >= (height/2 - 50) && mouseY <= (height/2 + 50)) {
    fill(rectColor);
  }
}


void mousePressed() {

  if (mouseX >= (width/2 - 50) && mouseX <= (width/2 + 50) && 
    mouseY >= (height/2 - 50) && mouseY <= (height/2 + 50)) {
    total = total - 1;
  }

  //float d = dist (mouseX, mouseY, width/2, height/2);
  //if (d<25){
  //if (mouseX>150 && mouseX<150 && mouseY>150 && mouseY<350) {
  //total = total - 1;
  //}
}

void keyPressed() {
  if (key == 's' || key =='S') {
    saveFrame("buttons-####.png");
  }
}

//boolean rectOver =false;

//boolean rectOver (){
//  if (mouseX >= (width/2 - 50) && mouseX <= (width/2 + 50) && 
//    mouseY >= (height/2 - 50) && mouseY <= (height/2 + 50)) {
//    return true;
//  } else {
//    return false;
//  }
//}
