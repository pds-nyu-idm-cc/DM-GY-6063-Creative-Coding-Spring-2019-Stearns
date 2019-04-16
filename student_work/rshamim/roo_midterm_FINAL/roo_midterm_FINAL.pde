import ddf.minim.*;
import ddf.minim.analysis.*;

float eRadius;
color fillColor = color(0);
Minim minim;
AudioPlayer player;
BeatDetect detector;



void setup() {
  size(640, 360);
  background(255);
  
  
  minim = new Minim(this);
  player = minim.loadFile("DEMIMONDE_boone.mp3");
  detector = new BeatDetect();
  ellipseMode(RADIUS);
  eRadius = 20;
  }


void draw()
{
  background(231,153,130);
 
  
  float posx = map(player.position(), 0, player.length(), 0, width);
  float posPercentage = map(player.position(), 0, player.length(), 0, 100);
  
     // line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
      //line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
     

  
        // hilma af klint arcs 
       
 //circle 1 white and blue move with posPercentage
 
   fill (224,218,208);
  
  arc(width/2, height/2, 300, 300, -PI/2+mouseX/5.0+ posPercentage/5.0, PI/2+mouseX/5.0+ posPercentage/5.0, PIE);
   fill (96,143,192);
   arc(width/2, height/2, 300, 300,PI+ -PI/2+ posPercentage/-10.00, PI+ PI/2+posPercentage/-10.00, PIE);
 //circle2 black and yellow
 
 fill (227,186,96);
  arc(width/2, height/2, 200, 200, -PI/2+ mouseX/-12.00 +posPercentage/10.0, PI+ PI/2+ mouseX/-12.00, PIE);

 fill (42,42,42);
 arc(width/2, height/2, 200, 200, -PI/2+ mouseX/8.00, PI/2+ mouseX/8.00, PIE);

fill (231,153,130);
 arc(width/2, height/2, 100, 100, PI+ -PI/2+ mouseX/-10.0, PI+ PI/2+ mouseX/-10.0, PIE);
      
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    fill (18,9,108);
    //
    // line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    //line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
 
 // i don't really understand the math. trial and error
      stroke (255);
      circle( x1, 180, 20 + player.right.get(i)*50);
      stroke (96,143,192);
      circle (x1, x1-180, 15 + player.right.get(i)*50);
      stroke (227,186,96);
      circle (x1, 500-x1, 15 + player.right.get(i)*50);
  }
  
  //beatdetect element
  stroke(255);
 detector.detect(player.left);
 float a = map(eRadius, 20, 80, 60, 255);
  fill(162, 170, 243, a);
   if ( detector.isOnset() ){
     eRadius = 80;
  ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}
  
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
  }}
