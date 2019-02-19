// gameScreen setting

float gameScreen = 0;
int total;
// random colorful circles setting
float r;
float g;
float a;
float b;
float diam;
float xcircle;
float ycircle;

// moving ball setting
float xball = 100;
float yball = 200;
float xspeed = 10;
float yspeed = 20;

float x2ball = 800;
float y2ball = 800;
float x2speed = 10;
float y2speed = 20;

//scoring
int score = 0;

void setup() {
  size(500, 500);
  frameRate(30);
}

// screens
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen

void draw() {
  background(0);
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameplayScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}

void initScreen() {
  background(0);
  // load image
  PImage astronaut;
  astronaut = loadImage("astronaut.jpg");
  image(astronaut, 0, 0);

  textAlign(CENTER);
  fill(242, 213, 43);
  textSize(20);
  text("Zoog is travelling in outter space.", width/2, height/1.5);
  text("You need to help Zoog dodge the ball.", width/2, height/1.4);
  text("Be careful, more than one ball...", width/2, height/1.3);
  textSize(30);
  text("Click to Start", width/2, height/1.1);
}

void mousePressed() {
  // on the initial screen, click mouse to start the game
  if (gameScreen == 0) {
    startGame();
  } else if (gameScreen == 2) {
    restart();
  }
  println(gameScreen);
}

void startGame() {
  gameScreen = 1;
}

void gameOver() {
  //score = 0; 
  gameScreen = 2;
}

void restart() {
  score = 0;
  gameScreen = 1;
}

// game setup

void gameplayScreen() {

  // game screen background art
  PImage meteorite;

  meteorite = loadImage("Meteorite.png");
  image(meteorite, 170, 300);
  meteorite.resize(50, 50);
  image(meteorite, 140, 230);
  meteorite.resize(60, 60);
  image(meteorite, 330, 120);

  // colorful circles
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(30);
  xcircle=random(width);
  ycircle=random(height);

  noStroke();
  fill(r, g, b, a);
  ellipse(xcircle, ycircle, diam, diam); 

  // main character
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(4);

  // body, change color
  stroke(0);
  fill(mouseX, mouseY, mouseY-mouseX);
  rect(mouseX, mouseY, 20, 100);

  // head
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-30, 60, 60);

  // eye, change color
  fill(mouseX-50, 0, mouseY-50);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);

  // leg, move with flow
  stroke(255);
  line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+60);
  line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+60);

  // ball moving
  xball = xball + xspeed;
  yball = yball + yspeed;

  // bounce back
  if (xball >= width-25 || yball <= 25) {
    //turn around
    xspeed = xspeed * -1;
  }

  if (yball >= height-25 || yball <= 25) {
    yspeed = yspeed * -1;
  }
  // draw the ball
  fill(255);
  stroke(0);
  ellipse(xball, yball, 50, 50);

  // Scoring
  stroke(255);
  textSize(20);
  text ("Score=" + score, 60, 40);  

  //The scond ball 
  x2ball = x2ball + x2speed;
  y2ball = y2ball + y2speed;

  if (x2ball >= width-25 || y2ball <= 25) {
    //turn around
    x2speed = x2speed * -1;
  }

  if (y2ball >= height-25 || y2ball <= 25) {
    y2speed = y2speed * -1;
  }

  //draw the second ball 
  fill(255);
  stroke(0);
  ellipse(x2ball, y2ball, 200, 200);
}

void mouseMoved() {

  float d = dist(xball, yball, mouseX, mouseY);
  float d2 = dist(x2ball, y2ball, mouseX, mouseY);

  if (d > 50 && d2 > 50) {
    score = score +1 ;

    if (score == 1500) {

      x2ball = 200;
      y2ball = 300;
    }
  } else {
    noLoop();
    total = score; 
    gameOver();
    loop();
  }
}

void gameOverScreen() {

  background(0);
  textAlign(CENTER);
  fill(255);
  text(total, width/2, height/2);
  textSize(15);
  text("Game Over", width/2, height/3);
  text("Total Score", width/2, height/2.2);
  fill(242, 213, 43);
  textSize(20);
  text("Click to Restart", width/2, height-30);
}
