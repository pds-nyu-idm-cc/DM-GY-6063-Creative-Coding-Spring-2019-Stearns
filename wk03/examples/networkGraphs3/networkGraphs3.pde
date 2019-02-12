// draw lots of nodes
int qtyPoints = 200;
// draw lines if shorter than
float maxDist = 75;

// declare location and speed of points
float[] pointX, pointY, speedX, speedY;

void setup() {

  size(500, 500);
  frameRate(30);

  // initialize location and speed
  pointX=new float[qtyPoints];
  pointY=new float[qtyPoints];
  speedX=new float[qtyPoints];
  speedY=new float[qtyPoints];

  // randomize
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
      // created a distance() function to return the distance between two points
      if ( distance(pointX[i], pointY[i], pointX[j], pointY[j]) < maxDist) {
        line(pointX[i], pointY[i], pointX[j], pointY[j]);
      }
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
    } else if (pointX[i] > width && speedX[i] > 0) {
      speedX[i]*=-1;
      pointX[i]=width;
    }

    if (pointY[i] < 0  && speedY[i] < 0) {
      speedY[i]*=-1;
      pointY[i]=0;
    } else if (pointY[i] > height  && speedY[i] > 0) {
      speedY[i]*=-1;
      pointY[i]=height;
    }
  }
}

float distance(float _x1, float _y1, float _x2, float _y2) {
  // the distance between two points is the length of the hypotenuse of a right triangle formed between them
  // (x^2 + y^2)^0.5 where x is equal to x2 - x1 and y is equal to y2 - y1
  return pow( pow( _x2 - _x1, 2) + pow( _y2 - _y1, 2), 0.5);
}
