// the region variable is used to confine the points to a region
float region=150;

// declare an instance of an object in the Curve class, named curve
Curve curve;

void setup() {
  size(800, 800);
  background(255);
  noLoop();

  // initialize the object by using the Curve() constructor
  curve = new Curve();
}

void draw() {
  // refresh frame
  background(255);

  // draw title, region boundary, and instructions
  drawTitle();
  drawRegion();
  drawInstructions();

  // rad the curve, points 
  curve.drawCurve();
  curve.drawPoints();
  curve.drawPointLabels();
  
}

void drawTitle() {
  fill(127);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("curve() demo", width/2, height/2 - region - 20);
}

void drawRegion() { 
  stroke(127);
  strokeWeight(.5);
  noFill();
  rect((width/2)-region, (height/2)-region, 2*region, 2*region);
}

void drawInstructions() {
  fill(127);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Press \"Space Bar\" to draw a new curve.", width/2, height/2 + region + 20);
}


// key bindings
void keyPressed() {
  switch (key) {
  case ' ':
    curve = new Curve();
    redraw();
    break;
  }
}

// once we define a class, it's easier to make complex curves with an arbitrary number of segments

class Curve {

  // curves have 4 points:
  // first point is a control point to determine the curvature for start
  // next two points are the start and end of the curve
  // last point is the control point for the end curvature 

  int qty_pts = 4;

  // arrays hold the coordinates of the points that describe the curve
  float[] pts_x = new float[qty_pts];
  float[] pts_y = new float[qty_pts];

  // style variables, stroke weight sW and stroke color sC
  float sW;
  color sC;

  Curve() {

    for (int i = 0; i < qty_pts; i++) {
      pts_x[i]= random(-region, region)+width/2;
      pts_y[i]= random(-region, region)+height/2;
    }

    sW = 1;
    sC = #0000FF;
  }

  void update() {
  }

  void drawCurve() {
    // style and draw our curve
    stroke(sC);
    strokeWeight(sW);
    noFill();
    curve(pts_x[0], pts_y[0], pts_x[1], pts_y[1], pts_x[2], pts_y[2], pts_x[3], pts_y[3]);
  }

  void drawPoints() {
    for (int i = 0; i < qty_pts; i++) {
      //style and draw points
      stroke(#FF0000);
      strokeWeight(10);
      point(pts_x[i], pts_y[i]);
    }
  }

  void drawPointLabels() {
    for (int i = 0; i < qty_pts; i++) {
      //style and draw point labels
      fill(0);
      textAlign(LEFT, BOTTOM);
      text("pt:"+i, pts_x[i], pts_y[i]);
    }
  }
}
