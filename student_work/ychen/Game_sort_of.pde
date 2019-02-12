float ballx = 250;
float bally = 250;
float xspeed = -1;
float yspeed = 3;
color ballcolor = color (0);

int score = 0;
int lives = 5;

void setup() {
  size(500, 500);
}

void draw() {

  background(255);

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

  //drawing the ball
  fill(ballcolor);
  strokeWeight(1);
  ellipse(ballx, bally, 50, 50);

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


  //scoring display 
  stroke(0);
  textSize(20);
  text ("scores=" + score, 30, 45);    //score starts with 0
  text ("lives=" + lives, 30, 75);    //lives starts with 5
}

void mousePressed() {

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

  //winning
  if (score >= 10) {
    noLoop();
    background(255, 255, 153);
    fill(0);
    textSize(20);
    text("Congrats!", width/2, height/2);
  }

  //game over
  if (lives <= 0 ) {
    noLoop();
    background(0);
    fill(255);
    textSize(20);
    text("Oops...Game Over!", width/2, height/2);
  }

  //fill(0);
  //text("oops!", width/2, height/2);
  //textSize(50);
  //println("oops!");
}
