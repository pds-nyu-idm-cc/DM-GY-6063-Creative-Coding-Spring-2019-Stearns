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

class Ball {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12; // size of the ball
  
  Ball() {
    reset();
  }  
  
  // make the ball move
  void update() {
    x = x + xspeed;
    y = y + yspeed; 
  }
  
  // make the ball back to screen center and move to random direction
  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }
  
  // check screen edges and bounce back
  void edges() {
    if (y + r < 0 || y > height) {
      yspeed *= -1;
    }

    if (x - r > width) {
      xspeed *= -1;
      //reset();
      //Score ++;   // Originally I want to make the Pong game to be two-people compact game
    }

    if (x + r < 0) {
      xspeed *= -1;
      //reset();
      //Score ++;
    }
  }
  
  // the desgin of the ball
  void show() {
    fill(255, 191, random(70, 100)); // ball color: yellow
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
  
  // check for ball and square collision
  void checkSquare(Square s) {
    // divide the square in the middle to bounce different directions
    float midx = (s.minx+s.maxx)/2;
    float midy = (s.miny+s.maxy)/2;
    
    // if the ball hits the left side, bouce left
    if (y > s.miny && y < s.maxy) {
      if (x > s.minx && x < midx) {
        xspeed= - abs(xspeed);
        exps.add( new Explosion(new PVector(x, y)) ); // make an explosion
        Score ++; // score+1
      }
    }
    
    // if the ball hits the right side, bouce right
    if (y > s.miny && y < s.maxy) {
      if (x > midx && x < s.maxx) {
        xspeed *= -1;
        exps.add( new Explosion(new PVector(x, y)) ); // make an explosion
        Score ++; // score+1
      }
    }
    
    // if the ball hits the upper side, bouce up
    if (y > s.miny && y < midy) {
      if (x > s.minx && x < s.maxx) {
        yspeed= - abs(yspeed);
        exps.add( new Explosion(new PVector(x, y)) ); // make an explosion
        Score ++; // score+1
      }
    }
    
    // if the ball hits the bottom of the square, bounce down
    if (y > midy && y < s.maxy) {
      if (x > s.minx && x < s.maxx) {
        yspeed *= -1;
        exps.add( new Explosion(new PVector(x, y)) ); // make an explosion
        Score ++; // score+1
      }
    }
  }
  
  // speed up the ball when score gets higher
  void speed() {
    if (Score > 100) {
      x = x + xspeed*1.5;
      y = y + yspeed*1.5; 
    }
    if (Score > 300) {
      x = x + xspeed*2;
      y = y + yspeed*2;
    }
    if (Score > 500) {
      x = x + xspeed*2.5;
      y = y + yspeed*2.5;
    }
    if (Score > 1000) {
      x = x + xspeed*5;
      y = y + yspeed*5;
    }
  }  
}

//I used boolean to detect the collision, but it turned out not working.
//Because I realized there should be two-side detection.

//boolean collision = false;

//boolean collison(float x, float y, float minx, float miny, float maxx, float maxy) {
//  if (x >= minx && x <= maxx && y >= miny && y <= maxy) {
//    return true;
//  } else {
//    return false;
//  }
//}
