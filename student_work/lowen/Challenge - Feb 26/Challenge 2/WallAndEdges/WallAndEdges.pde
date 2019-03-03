int numBalls = 2;
int ballX[] = new int[numBalls];
int ballY[] = new int[numBalls];
float speedX[] = new float[numBalls];
float speedY[] = new float[numBalls];
color colorBalls = color(205, 182, 210);


void setup(){
  size(400, 400);
  for(int i = 0; i < numBalls; i++){ 
    ballX[i] = int(random(50, width-50));
    ballY[i] = int(random(50, width-50));
    speedX[i] = int(random(1, 4));
    speedY[i] = int(random(1, 4));
  }
}

void draw(){
  background(255);
  fill(0);
  for(int i = 0; i<numBalls; i++){
    fill(colorBalls);
    ellipse(ballX[i], ballY[i], 50, 50);
    if(ballX[i] > width-10 || ballX[i] < 10){
      speedX[i] = speedX[i] * (-1);
    }
    if(ballY[i] > height-10 || ballY[i] < 10){
      speedY[i] = speedY[i] * (-1);
    }
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];
  }
}
