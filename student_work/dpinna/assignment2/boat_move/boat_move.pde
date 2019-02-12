import processing.sound.*;
PShape s, v;
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
  //myBoat = new Boat(boatX, boatY);
  file = new SoundFile(this, "sail.wav");
  
  file.play();
}
void draw() {

  background(208, 255, 255);
  v = loadShape("boat_color.svg");
  


  //island 
  //to reach the island x>=350, y>=550;
  noStroke();
  fill(255, 242, 155);
  ellipse(600, 700, 250, 30);
  //myBoat.sail(boatX, boatY);
  //myBoat.display();

  //boat visualised 
  shape(v, boatX, boatY, 150, 150);
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
}
