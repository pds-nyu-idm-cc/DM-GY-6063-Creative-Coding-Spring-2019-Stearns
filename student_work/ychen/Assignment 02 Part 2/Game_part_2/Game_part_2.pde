//what's new: target ball size changes; distractive background (maybe it's too distractive—eyes hurt!); collision
//ATTEMPT: tried to make a second moving ball for collision but failed (notice that sometimes they overlap)

float ballx, bally, xspeed, yspeed;
float ballsize, minSize, maxSize, sizeSpeed;
color ballcolor;

float ballx2, bally2, x2speed, y2speed;

boolean gameOver=false;

int score = 0;
int lives = 5;

void setup() {
  size(500, 500);
  initBall();
}

void draw() {
  //background color
  background(0);

  //instruction to begin
  fill(255);
  textSize(20);
  textAlign(LEFT);
  text("Click the small ball to begin!", 30, 30);

  //distractive background
  drawBackground(); //see new tab

  //ball size changes: shrink & grow
  if (ballsize < minSize || ballsize > maxSize) {
    sizeSpeed = -sizeSpeed;
  }

  ballsize = ballsize + sizeSpeed;

  //draw the 1st ball
  fill(ballcolor);
  strokeWeight(1);
  ellipse(ballx, bally, ballsize, ballsize);

  //draw the 2nd ball
  fill(143); //gray
  ellipse(ballx2, bally2, 100, 100);

  //scoring display 
  stroke(0);
  textSize(20);
  textAlign(LEFT);
  text ("scores=" + score, 30, 60);    //score starts with 0
  text ("lives=" + lives, 30, 80);    //lives starts with 5

  //win page
  if (score >= 5) {
    noLoop();
    background(255, 255, 153);
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Congrats!", width/2, height/2);
    text("(Click anywhere to restart.)", width/2, 450);
    gameOver=true;
  }

  //game over page
  if (lives <= 0 ) {
    noLoop();
    background(0);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Oops...Game Over!", width/2, height/2);
    text("(Click anywhere to restart.)", width/2, 450);
    gameOver=true;
  }

  moveBall();  //see new tab

  ballsCollide(); //see new tab
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

    if (d <= (ballsize/2)) { 
      yesClick = yesClick + 1;  //***
      score = score + yesClick;  //base score (0) plus amount of yesClick

      ballcolor = color (random(255), random(255), random(255));
    } else {
      lives = lives-1;
    }
  }
}

void initBall() {
  ballx = width/2;
  bally = height/2;
  xspeed = 1;
  yspeed = 4;

  ballsize = 50;
  minSize = 50;
  maxSize = 60;
  sizeSpeed = 2.5;

  ballcolor = color (255);
  score = 0;
  lives = 5;

  ballx2 = 200;
  bally2 = 200;
  x2speed = 5;
  y2speed = 3;
}
