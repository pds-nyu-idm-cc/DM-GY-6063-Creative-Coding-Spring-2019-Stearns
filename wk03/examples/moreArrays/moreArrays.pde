// make 100 moving balls
int qtyBalls=100;

float rMin=5;
float rMax=25;

// declare our arrays
float[] ballX;
float[] ballY;
float[] ballR;
float[] ballSpeedX;
float[] ballSpeedY;
color[] ballColor;

color strokeColor;
float lineWeight;

void setup() {

  size(500, 500);
  frameRate(30);

  strokeColor = color(0);
  lineWeight = 1;

  //initialize all the arrays
  ballX = new float[qtyBalls];
  ballY = new float[qtyBalls];
  ballR = new float[qtyBalls];
  ballSpeedX = new float[qtyBalls];
  ballSpeedY = new float[qtyBalls];
  ballColor = new color[qtyBalls];

  // randomize values
  for (int i = 0; i < qtyBalls; i++) {
    ballX[i]=random(width);
    ballY[i]=random(height);
    ballR[i]=random(rMin,rMax);
    ballSpeedX[i]=random(-2.5,2.5);
    ballSpeedY[i]=random(-2.5,2.5);
    ballColor[i]= color(random(255),random(255),random(255));
  }

  background(255);
}

void draw() {
  
  // cheap alpha fade
  noStroke();
  fill(255,25);
  rect(0,0,width,height);
  
  // update and draw all the balls!
  for (int i = 0; i < qtyBalls; i++) {
    
    // update the position by adding speed
    ballX[i]+=ballSpeedX[i];
    ballY[i]+=ballSpeedY[i];
    
    //wrap the position around the canvas
    ballX[i]=(ballX[i]+width)%width;
    ballY[i]=(ballY[i]+height)%height;
    
    // draw the ball
    stroke(strokeColor);
    strokeWeight(lineWeight);
    fill(ballColor[i]);
    ellipse(ballX[i], ballY[i], 2*ballR[i], 2*ballR[i]);
    
  }
  
}
