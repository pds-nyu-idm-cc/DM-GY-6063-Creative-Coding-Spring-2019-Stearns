color lineColor = color(127);

float[] originX, originY; // where to start drawing our line groups from

float[] stepX, stepY; // the direction to step for each iteration
float[] size; // (the length of the line)/2, more or less

int qty_objects; // the number of line groups we want to draw
int[] qty_lines; // array for number of lines to draw

void setup() {
  size(500, 500);
  background(255);
  
  
  // random number of line based objects 5-25
  qty_objects=int(random(5,25));
  
  //initialize all the arrays
  originX = new float[qty_objects];
  originY = new float[qty_objects];
  stepX = new float[qty_objects];
  stepY = new float[qty_objects];
  size = new float[qty_objects];
  qty_lines = new int[qty_objects];
  
  // fill the arrays with random values
  for (int i = 0; i < qty_objects; i++) {
    //starting point
    originX[i]=random(width);
    originY[i]=random(height);
    //direction to move and draw new line
    stepX[i]=random(-10, 10);
    stepY[i]=random(-10, 10);
    //length of the lines
    size[i]=random(-250, 250);
    //number of lines per group
    qty_lines[i]=int(random(50,200)); // we need to cast the random output to an integer
  }

  noLoop();
}

void draw() {
  background(255);

  for(int i = 0; i < qty_objects; i++) {
    for (int j = 0; j < qty_lines[i]; j++) {
      
      // calculate the points that form each line
      float x1 = originX[i] - size[i] + (j * stepX[i]);
      float y1 = originY[i] - size[i] + (j * stepY[i]);
      float x2 = originX[i] + size[i] + (j * stepX[i]);
      float y2 = originY[i] + size[i] + (j * stepY[i]);
      
      // calcualte the color so it does a nice fade
      lineColor=color(j*(255/qty_lines[i]));
      
      // style the line
      stroke(lineColor);
      // draw the line
      line(x1, y1, x2, y2);
      
    }
  }
}

void mousePressed(){
  setup();
  redraw();
  
}
