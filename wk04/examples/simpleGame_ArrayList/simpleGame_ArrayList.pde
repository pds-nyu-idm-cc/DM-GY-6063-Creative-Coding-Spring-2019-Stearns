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
ArrayList<GameObj> gameObjs;

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
  if (gameObjs.size() > 0) {
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
  for (GameObj g : gameObjs) {
    if (g.isActive) {
      // pass the index variable to moveObj() and drawObj() functions
      g.update();
      // wrap gameObjs around the screen
      g.wrap();
      // draw the gameObjs
      g.render();
    } // end if
  } // end for
} // end draw()



void initGameObjects() {

  // set our score to 0;
  score=0;

  // initialize the attribute arrays
  gameObjs = new ArrayList<GameObj>();

  // randomize speed and location
  // set the size of the game objects
  for (int i = 0; i < gameObj_qty; i++) {
    gameObjs.add(new GameObj());
  }
}


void mousePressed() {

  // check to see if there are any gameObjs in play
  if (gameObjs.size() > 0) {
    // create a flag to capture scoring clicks
    boolean scoredPoint = false;
    for (int i = gameObjs.size()-1; i >= 0; i--) {
      GameObj g = gameObjs.get(i);
      // check if the click was within the radius of the gameObj
      if (g.isClicked(mouseX, mouseY)) {
        gameObjs.remove(i);
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
