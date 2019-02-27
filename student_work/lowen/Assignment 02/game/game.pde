// Lauren Owen


PImage bg;
PImage labRat;
int ballX;
int ballY;
int value = 0;
int radius;
int ballSpeed;

//This was hard.
//I originally tried to make the mouse click boolean
//As you can see it did not work
//I was able to integrate a print messgae 
//until I can find a way to make it work in the game
//boolean labRatIsMoving;
//boolean labRatIsNotMoving;


void setup() {
  size(939, 400);
  // Background image
  // Obtained from Freepik.com
  // Customized by Lauren in Illustrator
  bg = loadImage("game.png");
  
  ballX = 30;
  ballY = 365;
  radius = 25;
  ballSpeed = 15;
  
  labRat =  loadImage("labrat.png");
  
}

void draw() {
  background(bg);
  
  fill(value);
  ellipse(ballX, ballY, radius*2, radius*2);

  //this should be the main character
  //but I cannot seem to make it move
   image(labRat, 850, 365);
   
//When I activate this
//The ball no longer changes colors
//This is frustration
  //labRatIsMoving = false;
  //labRatIsNotMoving = false;
  
  //if(labRatIsMoving || labRatIsNotMoving) {
    //print("Soon, Lauren soon.");
  //} else {
    //print("Yessssssssss.");
  //}

  
}

// Color change on click
// Would like this to be used for game hints
// when clicking on different items in background
void mouseClicked() {
  if (value == 0) {
    value = #FFC0CB;
  } else {
    value = 0;
  }
}

//if statements for keyboard
void keyPressed()
{
  if ( (keyCode == LEFT) && (ballX > radius) )
  {
    ballX = ballX - ballSpeed;
  }

  if ( (keyCode == RIGHT) && (ballX < width-radius) )
  {
    ballX = ballX + ballSpeed;
  }

  if ( (keyCode == UP) && (ballY > radius) )
  {
    ballY = ballY - ballSpeed;
  }

  if ( (keyCode == DOWN) && (ballY < height-radius) )
  {
    ballY = ballY + ballSpeed;
  }
  
}

//Lauren Owen
