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

// make an explosion with white smoke and fade away when the ball hits the square
class Explosion {
  PVector p;
  float r =0;
  Explosion(PVector _p) {
    p=_p;
  }
  void show() {
    if (255-r>0) {
      r+=5; // so that the explosion will fade away
      fill(255, 255-r*2);
      noStroke();
      ellipse(p.x,p.y,r/2,r/2);
    }
  }
}
