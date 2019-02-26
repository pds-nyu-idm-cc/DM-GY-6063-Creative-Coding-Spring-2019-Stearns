// define a region to work in
float region=150;

// declare an instance of an object of the Bezier class and name it bezier
Bezier bezier;

void setup() {
  size(800, 800);
  background(255);
  // initialize the Bezier object, bezier using the Bezier() constructor
  bezier= new Bezier();
}

void draw() {
  // clear frame
  background(255);

  // draw title, region, instructions
  drawTitle();
  drawRegion();
  drawInstructions();

  // update the bezier, draw it, and the points it comprises
  bezier.update();
  bezier.drawBezier();
  bezier.drawPoints();
  bezier.drawControls();
}


// function to draw the title
void drawTitle() {
  fill(127);
  textAlign(CENTER, CENTER);
  textSize(18);
  text("bezier() demo", width/2, height/2 - region - 20);
}

// function to draw the region
void drawRegion() { 
  stroke(127);
  strokeWeight(.5);
  noFill();
  rect((width/2)-region, (height/2)-region, 2*region, 2*region);
}

// function to draw the instructions
void drawInstructions() {
  fill(127);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Press \"Space Bar\" to draw a new bezier.", width/2, height/2 + region + 20);
}


// key bindings
void keyPressed() {
  switch (key) {
  case ' ':
    bezier= new Bezier();
    break;
  }
}


// once we define a class, it's easier to make complex beziers with an arbitrary number of segments
// definition for Bezier class
class Bezier {

  // our bezier consists of an array of 4 objects of class Point
  Point[] pts = new Point[4];

  // stroke weight and color values go here
  color sC = #0000FF;
  float sW = 1;
  color sC_control = #FF00FF;
  float sW_control = 0.25;

  Bezier() {

    // first point is an anchor point
    // next two points are control points for the bezier
    // last point is the anchor point for the end
    for (int i = 0; i < pts.length; i++) {
      pts[i]= new Point(random(-region, region)+width/2, random(-region, region)+height/2);
    }
  }

  // update the bezier
  void update() {
    // run the update method for each of the points
    for (int i = 0; i < pts.length; i++) {
      pts[i].update();
    }
  }

  // draw the bezier
  void drawBezier() {
    stroke(sC);
    strokeWeight(sW);
    noFill();
    bezier(pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y);
  }

  void drawControls() {
    stroke(sC_control);
    strokeWeight(sW_control);
    noFill();
    line(pts[0].x, pts[0].y, pts[1].x, pts[1].y);
    line(pts[2].x, pts[2].y, pts[3].x, pts[3].y);
  }

  // draw the points that make up the bezier
  void drawPoints() {
    for (int i = 0; i < pts.length; i++) {
      pts[i].drawPoint();
      pts[i].drawLabel("pt:"+i);
    }
  }
}


// definition for Point class
class Point {

  float x;
  float y;
  float sW = 10;
  color sC = #FF0000;
  color sC_sel = #00FF00; // color for isSelected
  float r = 10;
  boolean isSelected=false;

  Point(float _x, float _y) {
    x=_x;
    y=_y;
  }

  void update() {

    // check to see if the point is selected
    if (isSelected) {
      if (mousePressed) {
        x=x+(mouseX-pmouseX);
        y=y+(mouseY-pmouseY);
      }
    }

    // if the point is within range, select it
    if (isInRange(mouseX, mouseY)) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  void drawPoint() {

    // depending on whether the point is selected, change it's color to show we can interact with it
    if (isSelected) {
      stroke(sC_sel);
    } else {
      stroke(sC);
    }
    noFill();

    strokeWeight(sW);
    point(x, y);
  }

  void drawLabel(String _label) {
    fill(0);
    textAlign(LEFT, BOTTOM);
    text(_label, x, y);
  }

  boolean isInRange(float _x, float _y) {
    return dist(x, y, _x, _y) < r;
  }
}
