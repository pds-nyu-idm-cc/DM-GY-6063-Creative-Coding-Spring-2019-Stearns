//Feels - The Lo-Fi Live Code Music Experience
//Lauren Owen
//Whew. Thank goodness we have gotten so far. 
//I am proud of this creation because I can call it mine.
//Instead of linking directly to Sonic Pi, I have made the audio input the microphone
//So any sound or music played/heard will generate a responsive experience
//Added some cool features too like a recording option to gove users
//A record of the music the have generated ("R" to start/end recording, "S to save and playback
//Unfortunately, to generate a movie or video of the processing sketch, you must compile
//iindividual images. There is that function as well via mouse click

import ddf.minim.analysis.*;
import ddf.minim.*;
//How we recorded it http://code.compartmental.net/minim/audiorecorder_class_audiorecorder.html
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer jingle;
AudioInput input;
FFT fft;

float high = 0;
int spot = 0;
int [] cols = new int[3];

// recording
AudioInput in;
AudioRecorder recorder;
boolean recorded;

// playback
AudioOutput out;
FilePlayer player;

void setup()
{
  fullScreen();

  minim = new Minim(this);

  input = minim.getLineIn();

  fft = new FFT(input.bufferSize(), input.sampleRate());
  
  // the very necessary stereo line-in
  in = minim.getLineIn(Minim.STEREO, 2048);
  
  // the recorded file
  recorder = minim.createRecorder(in, "creations/feels.wav");
  
  // recording output
  out = minim.getLineOut( Minim.STEREO );
}

void draw()
{
  background(0);
  
  cols[0] = 255;
  cols[1]=0;
  cols[2]=150;

  fft.forward(input.mix);
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    if(fft.getBand(i)>high){
      high = fft.getBand(i);
      spot = 1;
    }
    //I wanted an alternating line of rectangles and circles
     fill(cols[2], fft.getBand(i) * cols[0], high*255);
     rect(i, 500, 25, fft.getBand(i) * -40);
     rect(i, 500, 25, fft.getBand(i) * 40);
     
     fill(cols[1], cols[2], fft.getBand(i) * cols[0], high*255);
     ellipse(i +width/4, 500, 15, fft.getBand(i) * 60); 
     
     fill(cols[2], fft.getBand(i) * cols[0], high*255);
     rect(i+width/2, 500, 25, fft.getBand(i) * -40);
     rect(i+width/2, 500, 25, fft.getBand(i) * 40);
     
     fill(cols[1], cols[2], fft.getBand(i) * cols[0], high*255);
     ellipse(i +(3*width)/4, 500, 15, fft.getBand(i) * 60); 
   }
   
}

void mouseClicked() {
  // save an imageof our groovy music visualization
    saveFrame("creations/feels-###.png");
}

void keyReleased()
{
  if ( !recorded && key == 'r' ) 
  {
    // And we are recording! 
    // Or we are done recording!
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
      recorded = true;
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( recorded && key == 's' )
  {
    //saving the audio file and playing it back via
    //the fileplayer enabled at beginning of sketch
    if ( player != null )
    {
        player.unpatch( out );
        player.close();
    }
    player = new FilePlayer( recorder.save() );
    player.patch( out );
    player.play();
  }
}
