/*
 * Final Project: Face Pong
 * By Yundi Jude Zhu
 * IDM Spring 2019
 * 
 * "Face Pong" is an AR Pong Game that can turn any same-color object into virtual paddels to hit the ball. 
 * Use the mouse to click on the object and the program will start color tracking and draw rectangles. 
 * Move your object to hit the ball to score.
 * The higher the score is, the faster the ball moves.
 * Press "s" to save a screenshot.
 * Press "r" to reset the ball's position, in case it's stuck somewhere.
 *
 * Check out the process here: http://www.juuud.com/argames
 */

class Square {
  float minx;
  float miny;
  float maxx;
  float maxy;

  ArrayList<PVector> points; // show the bones of the object

  Square(float x, float y) {
    minx = x;
    miny = y;
    maxx = x;
    maxy = y;
    points = new ArrayList<PVector>();
    points.add(new PVector(x, y));
  }

  void show() {
    stroke(0);
    fill(255, 72, 88); //the color of the squares: pinkish red
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minx, miny, maxx, maxy);
    
    for (PVector v : points) {
      stroke(33, 130, 191); // show the bones in mint
      point(v.x, v.y);
    }
  }

  void add(float x, float y) {
    points.add(new PVector(x, y));
    minx = min(minx, x);
    miny = min(miny, y);
    maxx = max(maxx, x);
    maxy = max(maxy, y);
  }

  float size() {
    return (maxx-minx)*(maxy-miny);
  }

  // merge the squares when they are close to each other
  boolean isNear(float x, float y) {

    // Closest point in square strategy
    float d = 10000000;
    for (PVector v : points) {
      float tempD = distSq(x, y, v.x, v.y);
      if (tempD < d) {
        d = tempD;
      }
    }

    if (d < distThreshold*distThreshold) {
      return true;
    } else {
      return false;
    }
  }
}
