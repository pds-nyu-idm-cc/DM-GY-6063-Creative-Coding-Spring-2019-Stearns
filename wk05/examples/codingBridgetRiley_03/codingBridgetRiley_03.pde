// A sketch attempting to recreate the work of Bridget Riley
// After examining her work, 'Cool Place',
// the first step is to create the basica element:
// a parallelogram using quad()

// a quad() is created by specifying 4 points counter clockwise
// the x and y coordinates of our 4 points
float[] x = new float[4];
float[] y = new float[4];

// the height of on of the sides
float quadSideHeight=40;

// the width of the quad()
float quadWidth=60;

// the amount the right side is shifted up
float quadSkew=50;

void setup() {
  
  size(900, 600);
  noLoop();
  
}

void draw() {
  
  // calculate how many parallelograms to draw vertically
  int qty_rows = int(height/(quadSideHeight))+4;
  
  // draw a column of parllelograms!
  for (int y = 0; y < qty_rows; y++) {
    
    color fillColor = color(random(256), random(256), random(256));
    fill(fillColor);
    
    drawParallelogram(0, y*quadSideHeight);
    
  }
  
}

void drawParallelogram(float _x, float _y) {

  // a function that performs the calculations of the points
  calculatePoints(_x, _y);

  noStroke();
  quad(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);
  
}

void calculatePoints(float _x, float _y) {
  
  // 1st point, the origin
  x[0]=_x;
  y[0]=_y;
  
  // 2nd point, move up from the origin
  x[1]=x[0];
  y[1]=y[0]-quadSideHeight;
  
  // 3rd point, move right and then up
  x[2]=_x+quadWidth;
  y[2]=_y-(quadSideHeight+quadSkew);
  
  // 4th point, move down to finish the shape
  x[3]=x[2];
  y[3]=y[2]+quadSideHeight;
  
}
