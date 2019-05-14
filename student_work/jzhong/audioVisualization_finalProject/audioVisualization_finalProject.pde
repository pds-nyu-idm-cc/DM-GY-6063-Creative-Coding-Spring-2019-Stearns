/*
This is a final project for Creative Coding written by James Zhong

This audio visualizer detects frequencies and beats, and sample 
data which is then used to create graphics.

Please use number keys 1-5 and 0 to turn on/off each graphic effect.

To change the audio, save the designated audio file in the /data/
folder and replace the audio name below--besure to include the file-
type suffix.
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

ArrayList<Circle> circles;

boolean[] modes;

int qtyModes;

float rad = 30;
float r = 50;
float s = 5;
float dist, dist_snare, dist_hat;
float kickSize, snareSize, hatSize;

Minim         minim;
AudioPlayer   audio;
BeatDetect    detector;
BeatListener  bl;
FFT           fft;

void setup () {
  size(800, 800);

  qtyModes=6;
  modes = new boolean[qtyModes];

  //minim
  minim = new Minim(this);
  //load audio
  audio = minim.loadFile("Sa Ka Fête (Mastered V1) .mp3", 1024);//audio file is saved in the /data/ folder
  //loop the audio
  audio.loop();

  //beat detector objects
  detector = new BeatDetect(audio.bufferSize(), audio.sampleRate());
  detector.setSensitivity(30);//the sensitivity is in (ms) - after this amout of time will the beat detector detect another beat

  //beat listener objects
  bl = new BeatListener(detector, audio);

  //FFT objects
  fft = new FFT (audio.bufferSize(), audio.sampleRate());
  fft.linAverages(30);

  //circle (particle) objects
  circles = new ArrayList<Circle>();

  for (int i=0; i<30; i++) { //adding 30 circles to the ArrayList
    circles.add(new Circle( //passing data to class
      new PVector( map(i, 0, 30, 0, width), height/2), //this passes position data to PVector _p 
      new PVector(0, 0) //this passes velocity data to PVector _v
      ) 
      );
  }
  modes[int(random(1,5))] = true; //open with a random mode, which can be turned off and turned back on again by user
}

void draw() {

  detector.detect(audio.mix);

  calculations();
  
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
  /* alternating modes through switch
   //switch(key){
   //case '0':
   //strange();
   //break;
   //case '1':
   //rotating_circles();
   //break;
   //case '2':
   //rotating_freq();
   //break;
   //case '3':
   //rotating_freq2();
   //break;
   //case '4':
   //particles();
   //break;
   //default:
   //freq();
   //break;
   //}
  
  /*ONLY enable the mode above (and comment out the 
  other other) to make the modes alternate instead of
  switching on and off*/


  /*alternating modes with the qtyModes array*/
  if (modes[0]) strange();
  if (modes[1]) rotating_circles();
  if (modes[2]) rotating_freq();
  if (modes[3]) rotating_freq2();
  if (modes[4]) particles();
  if (modes[5]) freq();
}


void calculations() {
  if (detector.isKick()) {
    r = random(30, 50);
    dist = random(0, 5);
    println("isKick");
  }

  if (detector.isSnare()) {
    dist_snare = random(0, 5);
    println("isSnare");
  }

  if (detector.isHat()) {
    dist_hat = random(0, 5);
    rad = random(15, 40);
    println("isHat");
  }
}

void keyPressed() {
  switch(key) {
  case'0':
    modes[0] = !modes[0];
    break;
  case'1':
    modes[1] = !modes[1];
    break;
  case'2':
    modes[2] = !modes[2];
    break;
  case'3':
    modes[3] = !modes[3];
    break;
  case'4':
    modes[4] = !modes[4];
    break;
  case'5':
    modes[5] = !modes[5];
    break;
  default:
    println("Mode not available yet!");
    break;
  }
}
