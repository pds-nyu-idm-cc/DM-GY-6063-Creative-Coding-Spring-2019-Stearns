import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Circle c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30;

//variables
float freq, amp;
int i, r = 0;
float speed = 1;
//declare regular minim stuffs
Minim        minim;
AudioPlayer  audio;
FFT          fftLin;
FFT          fftLog;

void setup () {
  //set screen
  size(512, 512);
  background(0);

  //load minim
  //load audio file and set buffer size
  minim = new Minim(this);
  audio = minim.loadFile("Sa Ka Fête (Mastered V1) .mp3", 1024);
  //loop the audio
  audio.loop();

  //FFT objects
  fftLin = new FFT( audio.bufferSize(), audio.sampleRate());
  //calculate averages by grouping frequencies into 30 entities
  //corresponds with my 30 circles
  fftLin.linAverages(30);

  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages( 30 );

  // create an FFT object for calculating logarithmically spaced averages
  fftLog = new FFT( audio.bufferSize(), audio.sampleRate() );

  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages( 22, 3 );


  //Class
  c1 = new Circle(i, random(height), fftLin.getBand(i));
  c2 = new Circle(random(width), freq, amp);
  c3 = new Circle(random(width), freq, amp);
  c4 = new Circle(random(width), freq, amp);
  c5 = new Circle(random(width), freq, amp);
  c6 = new Circle(random(width), freq, amp);
  c7 = new Circle(random(width), freq, amp);
  c8 = new Circle(random(width), freq, amp);
  c9 = new Circle(random(width), freq, amp);
  c10 = new Circle(random(width), freq, amp);
  c11 = new Circle(random(width), freq, amp);
  c12 = new Circle(random(width), freq, amp);
  c13 = new Circle(random(width), freq, amp);
  c14 = new Circle(random(width), freq, amp);
  c15 = new Circle(random(width), freq, amp);
  c16 = new Circle(random(width), freq, amp);
  c17 = new Circle(random(width), freq, amp);
  c18 = new Circle(random(width), freq, amp);
  c19 = new Circle(random(width), freq, amp);
  c20 = new Circle(random(width), freq, amp);
  c21 = new Circle(random(width), freq, amp);
  c22 = new Circle(random(width), freq, amp);
  c23 = new Circle(random(width), freq, amp);
  c24 = new Circle(random(width), freq, amp);
  c25 = new Circle(random(width), freq, amp);
  c26 = new Circle(random(width), freq, amp);
  c27 = new Circle(random(width), freq, amp);
  c28 = new Circle(random(width), freq, amp);
  c29 = new Circle(random(width), freq, amp);
  c30 = new Circle(random(width), freq, amp);
}

void draw () {
  background(0);
  stroke(255);

  //forward FFT on the audio file, with left and right channels mixed
  fftLin.forward(audio.mix);
  fftLog.forward(audio.mix);

  //draw cricles
  r+=speed;
  for (int i = 0; i < fftLin.specSize(); i+=20)
  {
    //move up and down
    circle(i+5,r+height/2,fftLin.getBand(i)*2);

    
    //center out
    noFill();
    circle(width/2,height/2,fftLin.getBand(i)+2*i);//center out
    
    //regular fft for reference
    line (i, height*5/8, i, height*5/8 - fftLin.getBand(i)*4);
  }
  if (r >= height) {
    r = height - 1;
    r--;
  } else if (r <= 0) {
    r = 1;
    r++;
  }
  //circle(r,r,fftLin.getBand(r));

  
  //c1.display();
  //c1.animation();
  
  //i++;
  

}
