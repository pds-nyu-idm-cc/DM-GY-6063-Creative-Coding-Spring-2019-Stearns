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

import processing.video.*;

Capture video;

Ball ball;

color trackColor; 
float threshold = 20;
float distThreshold = 60;
int Score = 0;

ArrayList<Square> squares = new ArrayList<Square>();
ArrayList<Explosion> exps = new ArrayList<Explosion> ();

void setup() {
  size(640, 360);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 640, 360);
  video.start();
  trackColor = color(255, 0, 0);
  ball = new Ball();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);

  squares.clear();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++ ) {
    for (int y = 0; y < video.height; y++ ) {
      int loc = x + y * video.width;
      // Set up current color
      color currentColor = video.pixels[loc];
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
float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}

// Click on any pixel to track that pixel's similar color
// Save color where the mouse is clicked in trackColor
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}


void keyPressed() {
    if (key == 's') // Press "s" to save a screenshot
    {
     saveFrame();
    }
    if (key == 'r') // Press "r" to reset the ball's position
    {
     ball.reset();
    }
}
