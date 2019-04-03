/*
 * Midterm Project: Spongebob AR selfie app
 * By Yundi Jude Zhu
 * IDM Spring 2019
 * 
 * This is a prototype for taking selfies with AR characters from Spongebob. 
 * In this prototype, you are able to interact with the bubbles with your mouse. 
 * The bubbles will follow your mouse, and once you click on the screen, the bubbles will be pushed away.
 * You can also click on the headshot below to show Spongebob characters.
 * They will stand on your shoulder.
 * They will follow you anywhere as long as your face is in the camera.
 * You can pose for a photo by pressing the camera icon.
 * The photo will be stored in the same folder.
 * Enjoy and let's save the planet!
 *
 * Check out the process here: http://www.juuud.com/ar-spongebob-selfie-app
 */

import processing.video.*;
import gab.opencv.*;
import java.awt.*;
PImage patrick;
PImage squid;
PImage sponge;
PImage krab;

float r = 50; // radius for buttons
int imageIndex  = 0; // initial screen
int qtyBubbles = 100; // number of bubbless

Capture video;
OpenCV opencv;

Bubbles[] bubbles; // declare an array of bubbless

void setup() {
  size(340, 600);

  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();

  patrick = loadImage("Patrick Star.png");
  squid = loadImage("Squidward Tentacles.png");
  sponge = loadImage("spongebob.png");
  krab = loadImage("krab.png");

  // initialize the array
  bubbles = new Bubbles[qtyBubbles];

  // initialize the bubbless in the array
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubbles();
  }
}

void draw() {
  background(0);

  // to center the live camera image
  pushMatrix(); // push everything
  translate(-200, 0);

  pushMatrix(); // push the camera
  scale(2); // to make live camera image full screen
  opencv.loadImage(video);
  image(video, 0, 0 );
  popMatrix(); // pop the camera

  PImage logo;
  logo = loadImage("SpongeBob logo.png");
  image(logo, 270, 5); // logo centered on top

  // face detection
  Rectangle[] faces = opencv.detect();
  println(faces.length); // to test how many faces are detected

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x*2 + "," + faces[i].y*2); // to test whether face is detected

    // conditions for drawing stickers
    PImage thingsToDraw = null;
    if (imageIndex==1) {
      thingsToDraw=squid;
    } else if (imageIndex==2) {
      thingsToDraw=patrick;
    } else if (imageIndex==3) {
      thingsToDraw=sponge;
    } else if (imageIndex==4) {
      thingsToDraw=krab;
    }

    if (thingsToDraw!=null) {
      pushMatrix(); // push the sticker
      imageMode(CENTER);
      translate(faces[i].x*1.5, faces[i].y*1.5);
      //rotate(frameCount/10.);
      image(thingsToDraw, 40, 170, faces[i].width*2, faces[i].height*2);
      popMatrix();
      imageMode(CORNER); // pop the sticker
    }
  }
  popMatrix(); // pop everything

  drawBubbles();
  
  button1();
  button2();
  button3();
  button4();
  takePicture();
}

void mousePressed() {
  pushAway();
  //imageIndex+=1; // mousePressed to switch stickers
}

void thingsToDraw() {
}

void button1() { // Squidward
  fill(255);
  boolean mouseOnTop = dist(mouseX, mouseY, r, 550)<30;
  if (mouseOnTop) {
    fill(49, 139, 163);
    if (mousePressed) {
      imageIndex = 1;
    }
  }
  ellipse(50, 550, r, r); // button1 squidward design
  PImage squidhead;
  squidhead = loadImage("Squidward head.png");
  squidhead.resize(50, 50);
  image(squidhead, 25, 525); // pretend to be the button
}

void button2() { // Patrick star
  fill(255);
  boolean mouseOnTop = dist(mouseX, mouseY, 130, 550)<30;
  if (mouseOnTop) {
    fill(255, 132, 124);
    if (mousePressed) {
      imageIndex = 2;
    }
  }
  ellipse(130, 550, r, r); // button2 Patrick star design
  PImage patrickhead;
  patrickhead = loadImage("patrick head.png");
  patrickhead.resize(50, 50);
  image(patrickhead, 105, 525); // pretend to be the button
}

void button3() { // Spongebob
  fill(255);
  boolean mouseOnTop = dist(mouseX, mouseY, 215, 550)<30;
  if (mouseOnTop) {
    fill(255, 170, 0);
    if (mousePressed) {
      imageIndex = 3;
    }
  }
  ellipse(215, 550, r, r); // button3 Spongebob design
  PImage spongehead;
  spongehead = loadImage("Spongebob head.png");
  spongehead.resize(50, 50);
  image(spongehead, 190, 525); // pretend to be the button
}

void button4() { // mr.krab
  fill(255);
  boolean mouseOnTop = dist(mouseX, mouseY, 290, 550)<30;
  if (mouseOnTop) {
    fill(232, 74, 95);
    if (mousePressed) {
      imageIndex = 4;
    }
  }
  ellipse(290, 550, r, r); // button4 krab design
  PImage krabclaw;
  krabclaw = loadImage("krabclaw.png");
  krabclaw.resize(50, 50);
  image(krabclaw, 264, 525); // pretend to be the button
}

void takePicture() {
  fill(255);
  boolean mouseOnTop = dist(mouseX, mouseY, 170, 480)<30;
  if (mouseOnTop) {
    fill(255, 0, 0);
    if (mousePressed) {
      saveFrame();
    }
  }
  ellipse(170, 480, 60, 60); // camera design
  PImage camera;
  camera = loadImage("camera icon.png");
  camera.resize(50, 50);
  image(camera, 145, 455); // pretend to be the button
}

void drawBubbles() {
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
  }
}

void pushAway() {
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].speed=PVector.sub(bubbles[i].position, new PVector(mouseX, mouseY)).mult(10);
  }
}

void captureEvent(Capture c) {
  c.read();
}
