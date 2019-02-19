// A Simple ball clicking game

// how many game objects are in play, let's say 12
int gameObj_qty = 12; 

// a value to set all gameObjs to
float globalSize = 25;

// keep track of points!
int score;

// some basic color presets
color strokeColor = color(127, 255, 255);
color fillColor = color(255, 127, 255);

// arrays to hold the attributes of our gameObjs
float gameObj_posX[];
float gameObj_posY[];
float gameObj_speedX[];
float gameObj_speedY[];
float gameObj_size[];
boolean gameObj_isActive[];

void setup() {

  size(500, 500);
  background(255);

  // initialize
  initGameObjects();
}


void draw() {

  // start with a blank slate
  background(255);

  // draw the score to the screen:
  // if there are active gameObjs, display the score
  if (areActiveObjs()) {
    textSize(18);
    textAlign(LEFT);
    text("Score: "+score, 40, 40);
  } else { // otherwise, display the game over screen
    textAlign(CENTER, CENTER);
    textSize(36);
    text("GAME OVER!", width/2, -100+height/2);
    textSize(24);
    text("Score: "+score, width/2, 100+height/2);
  }

  // we iterate through all our game pieces
  for (int i = 0; i < gameObj_qty; i++) {
    // check if it isActive
    if (gameObj_isActive[i]) {
      // pass the index variable to moveObj() and drawObj() functions
      moveObj(i);
      // wrap gameObjs around the screen
      wrapObj(i);
      // draw the gameObjs
      drawObj(i);
    } // end if
  } // end for
} // end draw()

void moveObj(int _index) { 
  // increment the X and Y positions by the speed value
  gameObj_posX[_index] += gameObj_speedX[_index];
  gameObj_posY[_index] += gameObj_speedY[_index];
}

void wrapObj(int _index) {
  // keep the ball on screen by wrapping it around the edges
  gameObj_posX[_index]+=width;
  gameObj_posX[_index]%=width;
  gameObj_posY[_index]+=height;
  gameObj_posY[_index]%=height;
}

void drawObj(int _index) {
  stroke(strokeColor);
  fill(fillColor);
  ellipse(gameObj_posX[_index], gameObj_posY[_index], gameObj_size[_index], gameObj_size[_index]);
}

void initGameObjects() {

  // set our score to 0;
  score=0;

  // initialize the attribute arrays
  gameObj_posX = new float[gameObj_qty];
  gameObj_posY = new float[gameObj_qty];
  gameObj_speedX = new float[gameObj_qty];
  gameObj_speedY = new float[gameObj_qty];
  gameObj_size = new float[gameObj_qty];
  gameObj_isActive = new boolean[gameObj_qty];

  // randomize speed and location
  // set the size of the game objects
  for (int i = 0; i < gameObj_qty; i++) {
    gameObj_posX[i]= random(width);
    gameObj_posY[i] = random(height);
    gameObj_speedX[i] = random(-2.5, 2.5);
    gameObj_speedY[i] = random(-2.5, 2.5);
    gameObj_size[i] = globalSize;
    gameObj_isActive[i] = true;
  }
}

// a way of figuring out if we've clicked all the gameObjs
boolean areActiveObjs() {
  
  // set a flag
  boolean objsActive = false;
  
  // iterate through all gameObjs
  for (int i = 0; i < gameObj_qty; i++) {
    // |= is a way of accumulating logical values.
    // | means OR
    // false | false = false
    // false | true = true
    // true | false = true
    // true | true = true
    objsActive|= gameObj_isActive[i];
  }
  return objsActive;
}

void mousePressed() {

  // check to see if there are any gameObjs in play
  if (areActiveObjs()) {
    // create a flag to capture scoring clicks
    boolean scoredPoint = false;
    for (int i = 0; i < gameObj_qty; i++) {
      // check if the click was within the radius of the gameObj
      if (distance(mouseX, mouseY, gameObj_posX[i], gameObj_posY[i]) < gameObj_size[i]/2) {
        gameObj_isActive[i] = false;
        scoredPoint=true;
      }
    }
    // did we score any points?
    if (scoredPoint) {
      score++;
    } else {
      score--;
    }
  } else { // if no gameObjs in play, restart!
    initGameObjects();
  }
  
}

float distance(float _x1, float _y1, float _x2, float _y2) {
  // the distance between two points is the length of the hypotenuse of a right triangle formed between them
  // (x^2 + y^2)^0.5 where x is equal to x2 - x1 and y is equal to y2 - y1
  // see http://www.math.info/Algebra/Distance_Cartesian_Plane/
  return pow( pow( _x2 - _x1, 2) + pow( _y2 - _y1, 2), 0.5);
}
