int numBalls = 2;
int bX[] = new int[numBalls];
int bY[] = new int[numBalls];
float ampX[] = new float[numBalls];
float ampY[] = new float[numBalls];


void setup(){
  size(600, 600);
  for(int i = 0; i < numBalls; i++){ // initializing all the variables for the balls
    bX[i] = int(random(50, width-50));
    bY[i] = int(random(50, width-50));
    ampX[i] = 5;
    ampY[i] = 5;
  }
}

void draw(){
  background(255);
  fill(0);
  
  for(int i = 0; i<numBalls; i++){
    fill(random(255), random(255), random(255));
    ellipse(bX[i], bY[i], 50, 50);
    if(bX[i] > width-10 || bX[i] < 10){
      ampX[i] = ampX[i] * (-1);
    }
    if(bY[i] > height-10 || bY[i] < 10){
      ampY[i] = ampY[i] * (-1);
    }
    bX[i] += ampX[i];
    bY[i] += ampY[i];
  }
}
