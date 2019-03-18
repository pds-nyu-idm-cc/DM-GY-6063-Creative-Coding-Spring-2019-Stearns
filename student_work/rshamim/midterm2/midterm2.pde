import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
BeatDetect detector;

void setup() {
  size(640, 360);
  background(43,200,111);
    
  minim = new Minim(this);
  player = minim.loadFile("DEMIMONDE_boone.mp3");
  detector = new BeatDetect();
}      

void draw()
{
  background(0);
  stroke(255);
  detector.detect(player.left);
  
  if (detector.isOnset()){
    fill (11, 115, 200);
    circle(250, 250, 100);
  }
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    fill (0, 155, 100);
    //
    // line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    //line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
    circle( x1, x1, 20 + player.right.get(i)*50);
    circle (x1, 250, 10 + player.right.get(i)*50);
  }
  
  // draw a line to show where in the song playback is currently located
  float posx = map(player.position(), 0, player.length(), 0, width);
  stroke(0,200,0);
  line(posx, 0, posx, height);
  
  if ( player.isPlaying() )
  {
    text("Press any key to pause playback.", 10, 20 );
  }
  else
  {
    text("Press any key to start playback.", 10, 20 );
  }
}

void keyPressed()
{
  if ( player.isPlaying() )
  {
    player.pause();
  }
  // if the player is at the end of the file,
  // we have to rewind it before telling it to play again
  else if ( player.position() == player.length() )
  {
    player.rewind();
    player.play();
  }
  else
  {
    player.play();
  }
}
