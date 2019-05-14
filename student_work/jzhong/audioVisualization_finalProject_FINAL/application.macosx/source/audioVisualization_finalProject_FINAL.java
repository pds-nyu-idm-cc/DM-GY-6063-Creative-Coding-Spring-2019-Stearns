import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class audioVisualization_finalProject_FINAL extends PApplet {

/*
This is a final project for Creative Coding written by James Zhong

This audio visualizer detects frequencies and beats, and sample 
data which is then used to create graphics.

Please use number keys 1-5 and 0 to turn on/off each graphic effect.

To change the audio, save the designated audio file in the /data/
folder and replace the audio name below--besure to include the file-
type suffix.
*/








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

public void setup () {
  

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
  modes[PApplet.parseInt(random(1,5))] = true; //open with a random mode, which can be turned off and turned back on again by user
}

public void draw() {

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


public void calculations() {
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

public void keyPressed() {
  //using this switch to turn on/off each mode
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
class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  public void samples (float[] samps) {
    beat.detect(source.mix);
  }
  
  public void samples (float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }

}
class Circle {
  float x, y;
  PVector pos, vel, acc;
  int c;

  Circle(PVector _p, PVector _v) {
    pos = _p;
    vel = _v;
    acc = new PVector (0, 0);

    c = color(random(255), random(255), random(255));
  }

  public void update() {
    acc.y=(random(-1,1));
    vel.add(acc);
    pos.add(vel);
    vel.mult(0.99f);
    
    //add sine wave movement to circle when certain drum beat is detected
    //and change direct on the other axis
    if (detector.isSnare()){
      vel.add(new PVector(0,cos(frameCount/10.f)));
      vel.x=-vel.x;
    } else if (detector.isKick()){
      vel.y=-vel.y;
      vel.add(new PVector(sin(frameCount/10.f),0));
    }
    
    //wall detection
    if (pos.x>width-r){
      vel.x=-vel.x;
      pos.x=width-r;
    }
    if (pos.x<0+r){
      vel.x=-vel.x;
      pos.x=0+r;
    }
    if (pos.y>height-r){
      vel.y=-vel.y;
      pos.y=height-r;
    }
    if (pos.y<0+r){
      vel.y=-vel.y;
      pos.y=0+r;
    }
    
  }

  public void render() {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, rad, rad);
  }
}
public void freq () {
  colorMode(RGB,255);
  
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  
  fft.forward(audio.mix);
  
  colorMode(HSB,100);
  stroke(random(0, 100), random(15, 60), random(75,100));

  for (int i = 0; i < fft.specSize(); i++) {
    
    if(mousePressed){
      stroke(map(mouseX, 0, width, 0, 100), map(mouseY, 0, height, 25, 75), 100);
    }
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line(map(i, 0, fft.specSize(), 0, width), height/2 + fft.getBand(i)*8, map(i, 0, fft.specSize(), 0, width), height/2 - fft.getBand(i)*8 );

  }
}
public void particles () {
  //draw a rectangle as background, which has an alpha of 10
  //so the circles make tails when they move
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  
  for (Circle c: circles) {
    
    c.update();
    
    c.render();
  
}
  
}
public void rotating_circles () {
  colorMode(RGB, 255);
  
  
  fill(0,80);
  noStroke();
  rect(0,0,width,height);
  
  translate(width/2, height/2);

  
  for (int o = 0; o<3; o++) {
    for (int i=0; i<8; i++) {

      pushMatrix();
        switch(o){
          case 0:
            rotate(frameCount*.01f +2*PI/8*i);
            translate(o*100+map(dist, 0, 6, 30, 100), 0);
            break;
          case 1:
            rotate(-1*(frameCount*.01f +2*PI/8*i));
            translate(o*100+map(dist_snare, 0, 6, 40, 120), 0);
            break;
          case 2:
            rotate(frameCount*.01f +2*PI/8*i);
            translate(o*100+map(dist_hat, 0, 6, 50, 150), 0);
            break;
        }
        stroke(0);
        fill(255, 0, 0);
        ellipse(0, 0, r, r);
        rect(-s, -s, 2*s, 2*s);
      popMatrix();
      
    }
  }
  
  translate(-width/2, -height/2);
}
public void rotating_freq () {
  colorMode(RGB, 255);
  
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  
  fft.forward(audio.mix);
  
  translate(width/2, height/2);

  
    for (int i=0; i<fft.specSize(); i++) {
      
      pushMatrix();
        rotate( frameCount*.01f + 2*PI/(fft.specSize())*i);
  
        translate(120+map(dist, 0, 6, 50, 200), 0);
        stroke(151,280,150);
        float waveHeight = fft.getBand(i)*24;
          
          //compressing the differences among lines 
          if (waveHeight > 20 ){
            waveHeight = waveHeight/5;
            if (waveHeight >100 ){
              waveHeight = waveHeight/10;
            }
          }
          
        line(-waveHeight, 0, waveHeight, 0); 
        
        fill(255, 0, 0);

      popMatrix();
    }
  translate(-width/2, -height/2);
}
public void rotating_freq2() {
  colorMode(RGB, 255);
  
  //changing background color while a beat is detected
  if (detector.isRange(0,3,2)) {
    fill(50,38,117,50);
  } else if (detector.isKick()) {
    fill(159,79,68,50);
  } else if (detector.isSnare()) {
    fill(180,134,170,50);
  } else if (detector.isHat()) {
    fill(163,250,230,50);
  } else{
    fill(0,50);
  }
  
  noStroke();
  rect(0,0,width,height);

  fft.forward(audio.mix);

  translate(width/2, height/2);

  for (int i=0; i<fft.specSize()/2; i++) {

    pushMatrix();
      rotate( frameCount*.01f  + 2*PI/(fft.specSize())*i);
  
      stroke(101, 211, 110);
      float waveHeight = fft.getBand(i)*(map(dist, 0, 6, 50, 80));
      
      if (waveHeight > 300 ){
        waveHeight = 300 + (waveHeight-300)/4;
        
      }
      
      line(0, 0, waveHeight, 0); 

    popMatrix();
    
    pushMatrix();
      rotate( frameCount*.01f +2*PI/(fft.specSize())*i);
      line(0,0,-waveHeight, 0);
    popMatrix();
  }
  
  translate(-width/2, -height/2);
  
}
public void strange () {
  colorMode(RGB, 255);
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  strokeWeight(2);
  stroke(255, 211, 79);
  fft.forward(audio.mix);

  translate(width/2, height/2);

  
  for (int i=0; i<fft.specSize(); i++) {

    pushMatrix();
    rotate( (frameCount*.05f  + 2*PI/(fft.specSize())*i)* -1);

    translate(100+map(dist, 0, 6, 0, 50), 0);

    float waveHeight = fft.getBand(i)*50;

    //making the lines more managable 
    if (waveHeight > 20 ) {
      waveHeight = waveHeight/3;
      if (waveHeight >300 ) {
        waveHeight = 300;
      }
    }

    line(0, 0, 0, waveHeight); 

    fill(255, 0, 0);
    popMatrix();

    pushMatrix();
    rotate( (frameCount*.05f  + 2*PI/(fft.specSize())*i)* -1);
    translate(-1*(100+map(dist, 0, 6, 0, 50)), 0);
    line(0, 0, 0, -waveHeight); 
    popMatrix();
  }
  translate(-width/2, -height/2);
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "audioVisualization_finalProject_FINAL" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
