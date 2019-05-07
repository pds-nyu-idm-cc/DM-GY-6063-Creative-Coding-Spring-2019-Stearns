import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

ArrayList<Circle> circles;

float rad = 30;
float acc_y;
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

  //minim
  minim = new Minim(this);
  //load audio
  audio = minim.loadFile("Sa Ka Fête (Mastered V1) .mp3", 1024);
  //loop the audio
  audio.loop();

  //beat detector objects
  detector = new BeatDetect(audio.bufferSize(), audio.sampleRate());
  detector.setSensitivity(30);//the number is in (ms) - after this amout of time will the beat detector detect another beat

  //kickSize = snareSize = hatSize = 16;

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
    acc_y = map(fft.getBand(i)*8, 0, 50, -8, 8);
  }
}

void draw() {

  detector.detect(audio.mix);

  calculations();

  if (key == '1') {
    rotating_circles();
  } else if (key == '2') {
    rotating_freq();
  } else if (key == '3') {
    rotating_freq2();
  } else if (key == '4') {
    particles();
  } else if (key == '0') {
    strange();
  } else {
    freq();
  }
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
