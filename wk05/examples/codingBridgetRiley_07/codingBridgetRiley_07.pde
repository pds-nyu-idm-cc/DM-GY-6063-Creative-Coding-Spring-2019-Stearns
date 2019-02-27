// A sketch attempting to recreate the work of Bridget Riley
// After examining her work, 'Cool Place',
// the first step is to create the basica element:
// a parallelogram using quad()

//colors held in an array

color[] palette = {
  color(30, 90, 150), 
  color(60, 60, 60), 
  color(180, 70, 90), 
  color(30, 160, 180), 
  color(225, 90, 100), 
  color(75, 80, 60), 
  color(75, 180, 120), 
  color(140, 185, 220), 
  color(240, 230, 200), 
  color(205, 145, 180), 
  color(185, 125, 175), 
  color(80, 90, 70), 
  color(60, 150, 200), 
  color(95, 140, 75), 
  color(170, 185, 195), 
  color(250, 230, 140), 
  color(210, 225, 130)
};

// the height of on of the sides
float quadSideHeight=40;

// the width of the quad()
float quadWidth=60;

// the amount the right side is shifted up
float quadSkew=50;

// for storing the number of cells in our skewed grid
int qty_cols;
int qty_rows;

///////////////////////////////////////////////////////
// SETUP

void setup() {

  size(900, 600);
  noLoop();

  // calculate how many "rows" and "columns" of parallelograms to draw
  qty_cols = int(width/quadWidth)+1;
  qty_rows = int(height/(quadSideHeight))+10;
  
}

///////////////////////////////////////////////////////
// DRAW

void draw() {
  
  generateBridgetRiley();

}

///////////////////////////////////////////////////////
// GENERATE ART!

void generateBridgetRiley() {
  
  for (int y = 0; y < qty_rows; y++) {
    for (int x = 0; x < qty_cols; x++) {
      // randomly choose a color from the palette
      fill(palette[int(random(palette.length))]);

      drawParallelogram(x*quadWidth, y*quadSideHeight-((quadSkew-quadSideHeight)*x));
    }
  }
  
}

///////////////////////////////////////////////////////
// DRAW PARALLELOGRAM

void drawParallelogram(float _x, float _y) {

  // we moved this from the global scope just to clean things up
  float[] pts_x = new float[4];
  float[] pts_y = new float[4];

  // a function that performs the calculations of the points
  // we can actually pass the arrays for the points to it!
  calculatePoints(_x, _y, pts_x, pts_y);

  noStroke();
  quad(pts_x[0], pts_y[0], pts_x[1], pts_y[1], pts_x[2], pts_y[2], pts_x[3], pts_y[3]);
}

///////////////////////////////////////////////////////
// CALCULATE POINTS IN PARALLELOGRAM

void calculatePoints(float _x, float _y, float[] _pts_x, float[] _pts_y) {

  // 1st point, the origin
  _pts_x[0]=_x;
  _pts_y[0]=_y; 
  // 2nd point, move up from the origin
  _pts_x[1]=_pts_x[0];
  _pts_y[1]=_pts_y[0]-quadSideHeight-1;
  // 3rd point, move right and then up
  _pts_x[2]=_x+quadWidth;
  _pts_y[2]=_y-(quadSideHeight+quadSkew)-1;
  // 4th point, move down to finish the shape
  _pts_x[3]=_pts_x[2];
  _pts_y[3]=_pts_y[2]+quadSideHeight+1;
}

///////////////////////////////////////////////////////
// CLICK FOR NEW WORK

void mousePressed(){
  redraw();
}
