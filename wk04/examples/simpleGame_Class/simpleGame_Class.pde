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
GameObj[] gameObjs;

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
    if (gameObjs[i].isActive) {
      // pass the index variable to moveObj() and drawObj() functions
      gameObjs[i].update();
      // wrap gameObjs around the screen
      gameObjs[i].wrap();
      // draw the gameObjs
      gameObjs[i].render();
    } // end if
  } // end for
} // end draw()



void initGameObjects() {

  // set our score to 0;
  score=0;

  // initialize the attribute arrays
  gameObjs = new GameObj[gameObj_qty];

  // randomize speed and location
  // set the size of the game objects
  for (int i = 0; i < gameObj_qty; i++) {
    gameObjs[i]= new GameObj();
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
    objsActive|= gameObjs[i].isActive;
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
      if (gameObjs[i].isClicked(mouseX, mouseY)) {
        gameObjs[i].isActive = false;
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
