//audio library
//import ddf.minim.*;
//Minim minim;
//AudioPlayer sound;

import processing.sound.*;
SoundFile file1;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile file6;
SoundFile file7;


int x = 1;
int speed = 5;
float circleX;
float xoff = 0.0;


void setup() {
  size (800, 500);
  background(141, 50, 34);
  noStroke();
  circleX = width/5;

  file1 = new SoundFile(this, "sound.wav");
  file2 = new SoundFile(this, "C.mp3");
  file3 = new SoundFile(this, "F.mp3");
  file4 = new SoundFile(this, "G.mp3");
  file5 = new SoundFile(this, "Am.mp3");
  file6 = new SoundFile(this, "Em.mp3");
  file7 = new SoundFile(this, "7.mp3");



  //minim = new Minim(this);
}

void draw () {

  //1-keyS
  //background(255);
  fill(245, 245, 245);
  if (keyPressed && key=='s') {
    background(141, 50, 34);
    fill(243, 238, 208);
    pushMatrix();
    rectMode(CENTER);
    translate(width/2, height/2);
    rotate(sin(frameCount/10.0));
    fill(243, 238, 208);
    rect(0, 0, 300, 300);
    rotate(sin(frameCount/5.0));
    fill(243, 238, 208);
    rect(0, 0, 300, 300);
    //sin
    //frameCount ->
    //noise
    //map
    popMatrix();
  }
  rectMode(CORNER);
  //rect(160, 430, 55, 55, 7);
  rect(220, 430, 55, 55, 7);


  //2-keyD
  fill(240, 240, 240);
  //background(255);

  if (keyPressed && key=='d') {
    fill(111, 58, 78);
    pushMatrix();
    rectMode(CENTER);
    translate(width/2, height/2);
    rotate(sin(frameCount/1.0));
    fill(111, 58, 78);
    rect(100, 100, 100, 100);
    rotate(sin(frameCount/100.0));
    fill(111, 58, 78);
    rect(100, 200, 200, 100);
    popMatrix();
  }
  rectMode(CORNER);
  //rect(220, 430, 55, 55, 7);
  rect(280, 430, 55, 55, 7);


  //3-keyF

  fill(230, 230, 230);
  if (keyPressed && key=='f') {
    fill(103, 41, 40);
    pushMatrix();
    translate(width/10, height/50);
    rotate(sin(frameCount/1.0));
    fill(103, 41, 40);
    rect(100, 10, 10, 100);
    //rotate(sin(frameCount/5.0));
    //fill(103,41,40);
    //rect(0,100,100,400);
    popMatrix();
  }
  rect(340, 430, 55, 55, 7);



  //4-keyG
  fill(220, 220, 220);
  //background(255);
  if (keyPressed && key=='g') {
    if (x >= 100) {
      speed = speed * -1;
    }
    if (x <= 0) {
      speed = speed * -1;
    }
    x = x+speed;
    fill(179, 122, 106);
    circleX=circleX+random(4);
    ellipse(circleX, 200, x, x);
  }
  rect(400, 430, 55, 55, 7);



  //5-keyH
  fill(215, 215, 215);
  if (keyPressed && key=='h') {
    fill(202, 172, 160);
    pushMatrix();
    rectMode(CORNER);
    translate(width/2, height/2);
    rotate(frameCount/50.0);
    fill(202, 172, 160);
    rect(70, 70, 10, 40);
    popMatrix();
  }
  rect(460, 430, 55, 55, 7);



  //6-keyJ
  fill(210, 210, 210);
  if (keyPressed && key=='j') {
    //background(255);
    fill(89, 50, 52);
    noStroke();
    ellipse(random(width), random(height), 500, 1 );
  }

  //background(204);
  //if (keyPressed && key=='h'){
  //xoff = xoff + .01;
  //  float n = noise(xoff) * width;
  //  line(n, 0, n, height);
  //}
  rect(520, 430, 55, 55, 7);
}








void keyPressed() {

  println(key);
  if (key=='a') {
    file1.play();
  }   

  if (key=='s') {
    file2.play();
  }

  if (key=='d') {
    file3.play();
  }

  if (key=='f') {
    file4.play();
  }

  if (key=='g') {
    file5.play();
  }

  if (key=='h') {
    file6.play();
  }

  if (key=='j') {
    file7.play();
  }


  //player = minim.loadFile("groove.mp3");
}
