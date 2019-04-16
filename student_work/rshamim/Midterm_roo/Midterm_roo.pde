import processing.sound.*;
SoundFile file;
float cue = 0;

void setup() {
  size(640, 360);
  background(255);
    
  file = new SoundFile(this, "alonepattern.aif");
  file.play();
}      

void draw() {
}
