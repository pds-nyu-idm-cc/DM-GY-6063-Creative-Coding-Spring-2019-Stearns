int qtyPoints = 25;

float[] pointX, pointY, speedX, speedY;

void setup() {

  size(500, 500);
  frameRate(30);

  pointX=new float[qtyPoints];
  pointY=new float[qtyPoints];
  speedX=new float[qtyPoints];
  speedY=new float[qtyPoints];

  for (int i = 0; i < qtyPoints; i++) {
    pointX[i]=random(width);
    pointY[i]=random(height);
    speedX[i]=random(-2.5, 2.5);
    speedY[i]=random(-2.5, 2.5);
  }

  background(0);
}

void draw() {

  background(0);

  //draw all the lines first
  for (int i = 0; i < qtyPoints; i++) {
    for (int j = i+1; j < qtyPoints; j++) {
      stroke(127);
      strokeWeight(0.5);
      line(pointX[i], pointY[i], pointX[j], pointY[j]);
    }
  }

  //draw the points on top
  for (int i = 0; i < qtyPoints; i++) {
    stroke(255);
    strokeWeight(10);
    point(pointX[i], pointY[i]);
  }

  //update the points
  for (int i = 0; i < qtyPoints; i++) {
    pointX[i]+=speedX[i];
    pointY[i]+=speedY[i];
    
    // effectively detects collision with canvas edge
    // reverses the direction and speed
    if (pointX[i] < 0 && speedX[i] < 0) {
      speedX[i]*=-1;
      pointX[i]=0;
    } else if (pointX[i] > width && speedX[i] > 0){
      speedX[i]*=-1;
      pointX[i]=width;
    }
    
    if (pointY[i] < 0  && speedY[i] < 0) {
      speedY[i]*=-1;
      pointY[i]=0;
    } else if (pointY[i] > height  && speedY[i] > 0){
      speedY[i]*=-1;
      pointY[i]=height;
    }
    
  }
}
