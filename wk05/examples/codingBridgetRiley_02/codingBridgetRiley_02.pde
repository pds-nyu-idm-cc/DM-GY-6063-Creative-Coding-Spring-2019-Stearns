// A sketch attempting to recreate the work of Bridget Riley
// After examining her work, 'Cool Place',
// the first step is to create the basica element:
// a parallelogram using quad()

// a quad() is created by specifying 4 points counter clockwise
// the x and y coordinates of our 4 points
float[] x = new float[4];
float[] y = new float[4];

// the height of on of the sides
float quadSideHeight=20;

// the width of the quad()
float quadWidth=30;

// the amount the right side is shifted up
float quadSkew=30;

void setup() {
  size(900, 600);
}

void draw() {
  // a function created to encapsulate the previous example's code
  // used to draw a parallelogram
  drawParallelogram(0, height);
}

void drawParallelogram(float _x, float _y) {

  // a function that performs the calculations of the points
  calculatePoints(_x, _y);

  noStroke();
  quad(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);
}

void calculatePoints(float _x, float _y) {
  x[0]=_x;
  y[0]=_y;
  x[1]=x[0];
  y[1]=y[0]-quadSideHeight;
  x[2]=_x+quadWidth;
  y[2]=_y-(quadSideHeight+quadSkew);
  x[3]=x[2];
  y[3]=y[2]+quadSideHeight;
}
