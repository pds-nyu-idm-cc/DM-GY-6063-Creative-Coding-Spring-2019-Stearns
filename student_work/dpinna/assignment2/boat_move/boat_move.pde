import processing.sound.*;
PShape s, boatAnchored, sailingRight, sailingLeft, boatImage;
PFont font;
SoundFile file;
SoundFile success;
Boat myBoat;
Level level1, level2, level3;


int boatX = 100;
int boatY = 150;
int islandXlev1 = 550;
int islandYlev1 = 600;
int islandXlev2 = 200;
int islandYlev2 = 680;
int islandXlev3 = 300;
int islandYlev3 = 300;
int level = 1;
String status = "playing";

void setup() {
  size(800, 800, P3D);
  smooth();
  noCursor();
  playMusic();

  level1 = new Level(1, "Level One", islandXlev1, islandYlev1, 100, 300, 250, 320, 420, 450, 520, 430);
  level2 = new Level(2, "Level Two", islandXlev2, islandYlev2, 100, 100, 100, 100, 100, 100, 100, 100);
  level3 = new Level(3, "Level Three", islandXlev3, islandYlev3, 100, 100, 100, 100, 100, 100, 100, 100);
  myBoat = new Boat(boatX, boatY);

  boatAnchored = loadShape("boat_anchored.svg");
  sailingRight = loadShape("boat_sailing_right.svg");
  sailingLeft  = loadShape("boat_sailing_left.svg");
  boatImage = boatAnchored;
}

void draw() {

  //welcome to game screen
  //click start to start game

  if (level == 1) {
    level1.display();
    level1.winningScenario();
  } else if (level == 2) {
    level2.display();
    level2.winningScenario();
  } else if (level == 3) {
    level3.display();
    level3.winningScenario();
  }

  showLevel();
  myBoat.move();
  myBoat.display();


  //println("X: " +myBoat.xpos);
  //println("Y: " +myBoat.ypos);
}


void resetBoat() {
  myBoat.xpos = 100;
  myBoat.ypos = 150;
}



void showText() {
  String s = "You've reached the island!";
  String next = "Press ENTER to progress to the next level";
  fill(250);
  font = createFont("helvetica.ttf", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  background(0);
  text(s, 270, 320, 250, 150);
  font = createFont("helvetica.ttf", 24);
  textFont(font);
  text(next, 270, 460, 250, 150);
  file.stop();
}

void showGameOver() {
  String s = "Thanks for playing";
  String secondLine = "Looking for Monkey Island";
  String t = "Press TAB to restart the game";
  fill(250);
  font = createFont("helvetica.ttf", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  background(0);
  text(s, 170, 260, 400, 150);
  text(secondLine, 170, 320, 400, 150);
  font = createFont("helvetica.ttf", 24);
  textFont(font);
  text(t, 250, 440, 250, 150);
}


void keyPressed() {
  if (keyCode == LEFT) {
    myBoat.moveLeft = true;
  }

  if (keyCode == RIGHT) {
    myBoat.moveRight = true;
  }

  if (keyCode == UP) {
    myBoat.moveUp = true;
  }

  if (keyCode == DOWN) {
    myBoat.moveDown = true;
  }  
  //reset the game when TAB is pressed 
  if (keyCode == TAB) {
    resetBoat();
    level1.display();
    level = 1;
  }
  //load level 2 
  if (keyCode == ENTER) {
    resetBoat();
    if (level == 1 && status == "completed") {
      level = 2;
      level2.display();
      level2.winningScenario();
      status = "playing";
      println("started level2");
    } else if (level == 2 && status == "completed") {
      level = 3;
      level3.display();
      level3.winningScenario();
      status = "playing";
      println("started level3");
    } else if (level == 3 && status == "completed") {
      println("Thanks for playing");
    } else {
      println("Insert a coin");
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    myBoat.moveLeft = false;
    //boatX = boatX - boatSpeed;
  }
  if (keyCode == RIGHT) {
    myBoat.moveRight = false;
  }
  if (keyCode == UP) {
    myBoat.moveUp = false;
  }

  if (keyCode == DOWN) {
    myBoat.moveDown = false;
  }
}

void playMusic() {
  //Waves soundtrack
  file = new SoundFile(this, "sail.wav");
  file.play();
}

void showLevel() {
  String status = "Level: "+level;
  fill(240);
  rect(675, 20, 110, 75);
  fill(0);
  font = createFont("helvetica.ttf", 20);
  textFont(font);
  textAlign(CENTER, CENTER);
  text(status, 680, 20, 100, 50);
  String lives = "Lives: "+ 3;
  font = createFont("helvetica.ttf", 20);
  textFont(font);
  textAlign(CENTER, CENTER);
  text(lives, 680, 45, 100, 50);
}
