import processing.sound.*;
PShape s, boat, island, leaves;
PFont font;
SoundFile file;
SoundFile success;
//Boat myBoat;

int boatX = width/2;
int boatY = height/2;
int boatSpeed = 50;

void setup() {
  size(800, 800);
  smooth();
<<<<<<< HEAD:student_work/dpinna/assignment_03/boat_move/boat_move.pde
  noCursor();
  playMusic();

  level1 = new Level(1, "Level One", islandXlev1, islandYlev1, 100, 300, 250, 320, 420, 450, 520, 430);
  level2 = new Level(2, "Level Two", islandXlev2, islandYlev2, 100, 300, 200, 300, 400, 300, 500, 300);
  level3 = new Level(3, "Level Three", islandXlev3, islandYlev3, 50, 280, 120, 250, 180, 280, 420, 350);
  myBoat = new Boat(boatX, boatY);
=======
  //myBoat = new Boat(boatX, boatY);
  file = new SoundFile(this, "sail.wav");
>>>>>>> parent of 4212160... Part 2 of the sail game.:student_work/dpinna/assignment2/boat_move/boat_move.pde

  file.play();
}
void draw() {

  background(208, 255, 255);
  boat = loadShape("boat_color.svg");
  island = loadShape("island.svg");
  leaves = loadShape("leaf.svg");


  //island 
  //to reach the island x>=350, y>=550;
  noStroke();
  fill(255, 242, 155);
  //ellipse(600, 700, 250, 30);
  shape(island, 470, 510);
  
  //myBoat.sail(boatX, boatY);
  //myBoat.display();

  //boat visualised 
  shape(boat, boatX, boatY, 150, 150);
  shape(leaves, 575, 470);
  positionLogic();
  
}

void showText() {
  String s = "You've reached the island!";
  fill(250);
  font = createFont("helvetica.ttf", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  background(0);
  text(s, 270, 320, 250, 150);
  file.stop();
  //success = new SoundFile(this, "tada.wav");
  //success.play(1, 0.5);// Text wraps within text box
}


void positionLogic() {
  if (boatX>=350 && boatY>=550) {
    showText();
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    boatX = boatX - boatSpeed;
  }

  if (keyCode == RIGHT) {    
    boatX = boatX + boatSpeed;
  }

  if (keyCode == UP) {
    boatY = boatY - boatSpeed;
  }

  if (keyCode == DOWN) {
    boatY = boatY + boatSpeed;
  }
<<<<<<< HEAD:student_work/dpinna/assignment_03/boat_move/boat_move.pde

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
  String lives = "Hull: "+ 100+"%";
  font = createFont("helvetica.ttf", 20);
  textFont(font);
  textAlign(CENTER, CENTER);
  text(lives, 680, 45, 100, 50);
=======
>>>>>>> parent of 4212160... Part 2 of the sail game.:student_work/dpinna/assignment2/boat_move/boat_move.pde
}
