float ballx;
float bally;
float xspeed;
float yspeed;
color ballcolor;

boolean gameOver=false;

int score = 0;
int lives = 5;

void setup() {

  size(500, 500);

  initBall();
}

void draw() {

  background(255);

  drawGrid();

  //drawing the ball
  fill(ballcolor);
  strokeWeight(1);
  ellipse(ballx, bally, 50, 50);

  //winning
  if (score >= 10) {
    noLoop();
    background(255, 255, 153);
    fill(0);
    textSize(20);
    text("Congrats!", width/2, height/2);
    gameOver=true;
  }

  //game over
  if (lives <= 0 ) {
    noLoop();
    background(0);
    fill(255);
    textSize(20);
    text("Oops...Game Over!", width/2, height/2);
    gameOver=true;
  }

  moveBall();

  //scoring display 
  stroke(0);
  textSize(20);
  text ("scores=" + score, 30, 45);    //score starts with 0
  text ("lives=" + lives, 30, 75);    //lives starts with 5
}

void mousePressed() {
  if (gameOver) {
    initBall();
    loop();
    gameOver=false;
  } else {
    //clicking the target & scoring
    float d = dist(ballx, bally, mouseX, mouseY);
    int yesClick = 0;

    if (d <= 25) { 
      yesClick = yesClick + 1;  //***
      score = score + yesClick;  //base score (0) plus amount of yesClick

      ballcolor = color (random(255), random(255), random(255));
    } else {
      lives = lives-1;
    }
  }
}

void initBall() {
  ballx = 250;
  bally = 250;
  xspeed = -1;
  yspeed = 3;
  ballcolor = color (0);
  score = 0;
  lives = 5;
}

void moveBall() {
  //ball moving
  ballx = ballx + xspeed;
  bally = bally + yspeed;

  if (ballx >= width-25 || ballx <= 25) {
    //turn around
    xspeed = xspeed * -1;
  }

  if (bally >= height-25 || bally <= 25) {
    //turn
    yspeed = yspeed * -1;
  }
}

void drawGrid() {
  //drawing the background
  fill(0);
  stroke(0);
  strokeWeight(2);
  for (int x = 0; x < width; x = x+25) {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y = y + 25) {
    line(0, y, width, y);
  }
}
