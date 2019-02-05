int moveX;
float colorAngle = 0.0;

float xRed = 0, xGreen = 0, xBlue = 0;
float yRed = 133, yGreen = 183, yBlue = 232;
float redX = xRed, greenX = xGreen, blueX = xBlue;

float xYellowRed = 255, xYellowGreen = 255, xYellowBlue = 187;
float yWhiteRed = 192, yWhiteGreen = 192, yWhiteBlue = 192;
float yellowRedX = xYellowRed, yellowGreenX = xYellowGreen, yellowBlueX = xYellowBlue;


float speed = .005;

void setup() {
  moveX=0;
  size(650, 500);
  fill(255, 0, (sin(colorAngle+=speed)+1.0)/2.0);
}
void draw() {
  moveX++;
  background(redX, greenX, blueX);
  float sinval1 = sin(colorAngle);
  println(sinval1);
  redX = map(sinval1, -1, 1, xRed, yRed);
  greenX = map(sinval1, -1, 1, xGreen, yGreen);
  blueX = map(sinval1, -1, 1, xBlue, yBlue);
  colorAngle += speed;
  noStroke();

  sun();

  //Hills
  fill(0, 100, 0);
  noStroke();
  bezier(30, 360, 100, 90, 200, 360, 200, 360);
  bezier(530, 360, 600, 100, 600, 160, 650, 360);
  fill(72, 152, 56);
  noStroke();
  bezier(650, 360, 450, 10, 500, 360, 350, 360);
  bezier(0, 360, 50, 190, 100, 360, 100, 360);

  //Grass
  rectMode(BOTTOM);
  noStroke();
  fill(25, 178, 60);
  rect(0, 350, width, 500);

  
  //Sidewalk
  rectMode(BOTTOM);
  noStroke();
  fill(183, 173, 163);
  rect(0, 460, width, 475);
  //street
  fill(56, 56, 56);
  rect(0, 500, width, 475);

  //Fence
  rectMode(BOTTOM);
  noStroke();
  fill(127, 82, 41);
  rect(0, 350, width, 330);
  
    //trees
  noStroke();
  fill(160, 60, 49);
  rect(95, 360, 110, 310);
  fill(0, 126, 0);
  ellipse(100, 300, 70, 50);
  
  fill(160, 60, 49);
  rect(595, 360, 610, 310);
  fill(0, 126, 0);
  ellipse(600, 300, 70, 50);

  //First foor
  rectMode(CENTER);
  noStroke();
  fill(171, 115, 77);
  rect(325, 370, 400, 90);

  //Roof-left
  fill(102, 0, 3);
  quad(100, 325, 150, 300, 175, 300, 175, 325);

  //Second foor
  rectMode(CENTER);
  fill(171, 115, 77);
  noStroke();
  rect(300, 300, 250, 100);


  //balcony-floor
  stroke(0, 0, 0);
  fill(102, 0, 3);
  quad(425, 325, 425, 300, 475, 300, 525, 325);

  //balcony-back
  rectMode(CENTER);
  fill(192, 192, 192);
  rect(450, 292, 50, 17);
  //balcony-right  
  fill(192, 192, 192);
  quad(525, 325, 525, 305, 475, 283, 475, 300);
  //column
  fill(102, 0, 3);
  rect(470, 275, 10, 100);

  //column
  fill(102, 0, 3);
  rect(519, 285, 10, 70);
  //balcony-front rail
  fill(192, 192, 192);
  rect(475, 316, 100, 21);



  //balcony-roof
  noFill();
  stroke(102, 0, 3);
  strokeWeight(4);
  line(400, 240, 500, 240);
  line(400, 232, 487, 232);
  quad(400, 250, 400, 225, 475, 225, 519, 250);


  //Roof
  strokeWeight(1);
  fill(102, 31, 33);
  stroke(0, 0, 0);
  triangle(400, 200, 175, 250, 400, 250);
  strokeWeight(4);
  stroke(102, 0, 3);
  line(425, 195, 175, 250);

  
  //front steps
  strokeWeight(1);
  stroke(0, 0, 0);
  fill( 128, 128, 128);
  rect(300, 425, 155, 50);


  //Windows-First floor
  fill(yellowRedX, yellowGreenX, yellowBlueX);
  float sinval2 = sin(colorAngle);
  println(sinval2);
  yellowRedX = map(sinval2, -1, 1, xYellowRed, yWhiteRed);
  yellowGreenX = map(sinval2, -1, 1, xYellowGreen, yWhiteGreen);
  yellowBlueX = map(sinval2, -1, 1, xYellowBlue, yWhiteBlue);
 colorAngle += speed;
  rect(325, 375, 390, 80);
  //Windows-second floor
  rect(300, 290, 240, 70);

  //bushes
  noStroke();
  fill(0, 153, 35);
  ellipse(160, 410, 90, 20);
  ellipse(455, 410, 170, 20);

  //Door
  strokeWeight(1);
  stroke(0, 0, 0);
  noFill();
  rect(288, 380, 25, 70);
  rect(313, 380, 25, 70);
  rect(300, 340, 50, 10);

  //colmuns-right
  fill(102, 31, 33);
  quad(245, 415, 220, 450, 220, 275, 245, 250);
  fill(102, 0, 3);
  quad(192, 275, 220, 275, 245, 250, 218, 250);
  rect(205, 363, 28, 174);


  //colmuns-left
  fill(102, 31, 33);
  quad(345, 415, 370, 450, 370, 275, 345, 250);
  fill(102, 0, 3);
  rect(385, 363, 28, 174);
  quad(400, 275, 370, 275, 345, 250, 370, 250);
  //column-window
  fill(yellowRedX, yellowGreenX, yellowBlueX);
  float sinval3 = sin(colorAngle);
  println(sinval3);
  yellowRedX = map(sinval3, -1, 1, xYellowRed, yWhiteRed);
  yellowGreenX = map(sinval3, -1, 1, xYellowGreen, yWhiteGreen);
  yellowBlueX = map(sinval3, -1, 1, xYellowBlue, yWhiteBlue);
 colorAngle += speed;
  rect(205, 390, 25, 90);
  //column-window
  rect(386, 390, 25, 90);

  //hedges
  noStroke();
  fill(0, 153, 35);
  ellipse(30, 445, 150, 25);
  ellipse(110, 445, 150, 25);
  ellipse(480, 445, 150, 25);
  ellipse(560, 445, 150, 25);
  ellipse(600, 445, 150, 25);
  
  //tree
  noStroke();
  fill(160, 60, 49);
  rect(60, 390, 15, 50);
  fill(0, 126, 0);
  ellipse(60, 355, 70, 50);
  
  fill(160, 60, 49);
  rect(560, 370, 15, 50);
  fill(0, 126, 0);
  ellipse(560, 330, 70, 50);
}



void sun() {

  //Cloud #2
  fill(255, 211, 102);
  ellipse(550, moveX, 80, 80);
  if (moveX==width-30)
    moveX=-150;
}
