import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FacePong_Final_FINAL extends PApplet {

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



Capture video;

Ball ball;

int trackColor; 
float threshold = 20;
float distThreshold = 60;
int Score = 0;

ArrayList<Square> squares = new ArrayList<Square>();
ArrayList<Explosion> exps = new ArrayList<Explosion> ();

public void setup() {
  
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640, 360);
  video.start();
  trackColor = color(255, 0, 0);
  ball = new Ball();
}

public void captureEvent(Capture video) {
  video.read();
}

public void draw() {
  video.loadPixels();
  image(video, 0, 0);

  squares.clear();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // Set up current color
      int currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d = distSq(r1, g1, b1, r2, g2, b2);  // Core code for color tracking

      if (d < threshold*threshold) {

        boolean found = false;
        for (Square s : squares) {
          if (s.isNear(x, y)) {
            s.add(x, y);
            found = true;
            break;
          }
        }

        if (!found ) {
          Square s = new Square(x, y);
          squares.add(s);
        }
      }
    }
  }

  for (Square s : squares) {
    if (s.size() > 500) {
      s.show();
      ball.checkSquare(s);
    }
  }
  
  for(Explosion exp :exps) {
    exp.show();
  }

  // show the ball and detect collision
  ball.update();
  ball.edges();
  ball.show();
  ball.speed();
    
  // show scores
  text(Score, width/2, 40);
  fill(242, 213, 43);
  textSize(20);
  strokeWeight(5);
}

// Custom distance functions w/ no square root for optimization
public float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}

public float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

// Click on any pixel to track that pixel's similar color
// Save color where the mouse is clicked in trackColor
public void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}


public void keyPressed() {
    if (key == 's') // Press "s" to save a screenshot
    {
     saveFrame();
    }
    if (key == 'r') // Press "r" to reset the ball's position
    {
     ball.reset();
    }
}
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
  public void update() {
    x = x + xspeed;
    y = y + yspeed; 
  }
  
  // make the ball back to screen center and move to random direction
  public void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    xspeed = 5 * cos(angle);
    yspeed = 5 * sin(angle);

    if (random(1) < 0.5f) {
      xspeed *= -1;
    }
  }
  
  // check screen edges and bounce back
  public void edges() {
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
  public void show() {
    fill(255, 191, random(70, 100)); // ball color: yellow
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
  
  // check for ball and square collision
  public void checkSquare(Square s) {
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
  public void speed() {
    if (Score > 100) {
      x = x + xspeed*1.5f;
      y = y + yspeed*1.5f; 
    }
    if (Score > 300) {
      x = x + xspeed*2;
      y = y + yspeed*2;
    }
    if (Score > 500) {
      x = x + xspeed*2.5f;
      y = y + yspeed*2.5f;
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
  public void show() {
    if (255-r>0) {
      r+=5; // so that the explosion will fade away
      fill(255, 255-r*2);
      noStroke();
      ellipse(p.x,p.y,r/2,r/2);
    }
  }
}
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

  public void show() {
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

  public void add(float x, float y) {
    points.add(new PVector(x, y));
    minx = min(minx, x);
    miny = min(miny, y);
    maxx = max(maxx, x);
    maxy = max(maxy, y);
  }

  public float size() {
    return (maxx-minx)*(maxy-miny);
  }

  // merge the squares when they are close to each other
  public boolean isNear(float x, float y) {

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
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FacePong_Final_FINAL" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
