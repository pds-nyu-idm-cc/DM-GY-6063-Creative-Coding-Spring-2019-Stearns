
/*
 This is a POC demo for midterm presentation
 
 Problems: the isHat(), isRange(), isKick() are not working 
 because they require a BeatListener class 
 which does not seem to exist in this library
 
 */

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//variables
float i, r = 0;
float beatFactor, beatFactorX, beatFactorY;
float speed = 3;
float randomX, randomY;
float sizeChange;
float count;
//minim stuffs
Minim        minim;
AudioPlayer  audio;
BeatDetect   detector;
//BeatListener bl;
FFT          fftLin;
FFT          fftLog;

void setup () {
  //set screen
  size (500, 500);
  background (0);

  //load minim
  //load audio file and set buffer size
  minim = new Minim(this);
  audio = minim.loadFile("Sa Ka Fête (Mastered V1) .mp3", 1024);
  //loop the audio
  audio.loop();

  //beat detector objects
  detector = new BeatDetect();
  detector.setSensitivity(15);

  //FFT objects

  //fftLin
  fftLin = new FFT(audio.bufferSize(), audio.sampleRate());
  //group frequencies into 30 intities
  fftLin.linAverages(30);

  //fftLog - object that calculate lograithmically spaced averages
  fftLog = new FFT( audio.bufferSize(), audio.sampleRate());

  //calculating averages based on a minimum octave width of 22 Hz
  //split each octave into 3 bands
  //30 averages?
  fftLog.logAverages( 22, 3 );
}

void draw () {
  stroke(255);
  //background(0);

  //forward FFT on the audio file, mixed channels
  fftLin.forward(audio.mix);
  fftLog.forward(audio.mix);
  //beat detection on audio file, moxed channels
  detector.detect(audio.mix);


  movement_wallDetect();

  //draw shapes
  
  //switch between patterns: 
  //  1 - jumpy shapes
  //  2 - lines
  //  3 - centerOut
  if (key == '1') {
    jumpyShapes();
  } else if (key == '2') {  
    upAndDown();
  } else if (key == '3') {
    centerOut();
  } else {
    jumpyShapes();
    upAndDown();
    //centerOut();
  }

  //refreshes background when beat detected within the specific range
  if (detector.isRange(20, 100, 10)) {
    background(255);
    println("kick");
  } 
  int lowBand = 0;
  int highBand = 100;
  int threshold = 1;
  if (detector.isRange(lowBand, highBand, threshold)) {
    println("isRange");
  }
}

void jumpyShapes() {
  for (int i = 0; i < fftLog.specSize(); i+=30) {
    if (detector.isOnset()) {
      beatFactor = random(5, 15);
      beatFactorX = random(-20, 20);
      beatFactorY = random(-200, 200);
    }  
    //draw circles
    noStroke();
    fill(random(255), random(255), random(255));
    circle(i+beatFactorX+5, beatFactorY * fftLog.getBand(i)+height/2, beatFactor);
  }
}

void upAndDown() {
  for (int i = 0; i < fftLin.specSize(); i+=15) {
    if (detector.isOnset()) {
      beatFactor = random(2, 5);
      beatFactorX = random(-20, 20);
      beatFactorY = random(-50, 50);
      //speed = -speed; 
    }
    //draw circles
    noStroke();
    fill(127);
    if (detector.isHat()) {  
      randomX = random(-5, 5);
      randomY = random(-5, 5);
      println("isHat");
    } 
    circle(i+randomX+beatFactorX, r+fftLin.getBand(i)*beatFactorY, beatFactor);
  }
}

void centerOut() {
  for (int i = 0; i < fftLin.specSize(); i+=100) {
    noFill();
    stroke(127);
    if (detector.isOnset()) {
      randomX = random(-5, 5);
      randomY = random(-5, 5);
    } 
    if (detector.isKick()) {
      sizeChange = 1.5;
    } else {
      sizeChange = 1;
    }
    circle(width/2, height/2, (fftLin.getBand(i)*i)) ;
  }
}

void movement_wallDetect() {
  //movement + wall detection, should anything need to move up & down
  //50% chance of refreshing the background when the shapes hit the walls
  r+=speed;
  if (r > height) {
    r = height;
    speed=-speed;
    if (random(-1, 1)<.5) {
      background(0);
    }
  }
  if (r < 0) {
    r = 0;
    speed = -speed;
    if (random(-1, 1)<0) {
      background(255);
    }
    
  }
}
