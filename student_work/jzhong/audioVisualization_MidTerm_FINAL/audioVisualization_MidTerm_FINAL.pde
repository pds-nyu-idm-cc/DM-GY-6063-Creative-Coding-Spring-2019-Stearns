import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/*
  this is the version without using class
 I am supposed to transfer into class for more controlable circles
 
 And this is a POC demo for midterm presentation
 
 Problems: the isHat(), isRange(), isKick() are not working 
 because they require a BeatListener class 
 which does not seem to exist in this library
 
 */

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
FFT          fftLin;
FFT          fftLog;

void setup () {
  //set screen
  size (500, 500);
  //frameRate(30);
  background (0);

  //load minim
  //load audio file and set buffer size
  minim = new Minim(this);
  audio = minim.loadFile("Sa Ka Fête (Mastered V1) .mp3", 1024);
  //loop the audio
  audio.loop();

  //beat detector objects
  detector = new BeatDetect();
  detector.setSensitivity(300);

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
  //background(background);
  //forward FFT on the audio file, mixed channels
  fftLin.forward(audio.mix);
  fftLog.forward(audio.mix);
  //beat detection on audio file, moxed channels
  detector.detect(audio.mix);

  //draw shapes

  //movement + wall detection, should anything need to move up & down
  r+=speed;
  if (r > height) {
    r = height;
    speed=-speed;
    background(0);
  }
  if (r < 0) {
    r = 0;
    speed = -speed;
    background(255);
  }


  //  //center out
  //for (int i = 0; i < fftLin.specSize(); i+=3) {
  //  noFill();
  //  stroke(150);
  //  if (detector.isOnset()) {
  //    randomX = random(-5, 5);
  //    randomY = random(-5, 5);
  //  } 
  //  if (detector.isKick()) {
  //    sizeChange = 1.5;
  //  } else {
  //    sizeChange = 1;
  //  }
  //  circle(width/2, height/2, (fftLin.getBand(i)*i)) ;

  //}

  //jumpy shapes
  for (int i = 0; i < fftLog.specSize(); i+=30) {
    if (detector.isOnset()) {
      beatFactor = random(10, 20);
      beatFactorX = random(-20, 20);
      beatFactorY = random(-200, 200);
    }  
    //draw circles
    noStroke();
    fill(random(255), random(255), random(255));
    circle(i+beatFactorX+5, beatFactorY * fftLog.getBand(i)+height/2, beatFactor);
  }

  //move up and down
  for (int i = 0; i < fftLin.specSize(); i+=8) {
    if (detector.isOnset()) {
      beatFactor = random(1, 3);
      beatFactorX = random(-20, 20);
      beatFactorY = random(-10, 10);
      speed = -speed;
    }
    //draw circles
    noStroke();
    fill(127);
    if (detector.isHat()) {
      randomX = random(-5, 5);
      randomY = random(-5, 5);
      println("isHat");
    } 
    circle(i+randomX+beatFactorX, r+randomY+beatFactorY, beatFactor);
  }

  if (detector.isRange(20, 100, 10)) {
    println("kick");
  } 

  int lowBand = 0;
  int highBand = 10000;
  int threshold = 1;
  if (detector.isRange(lowBand, highBand, threshold)) {
    println("isRange");
  }
}
