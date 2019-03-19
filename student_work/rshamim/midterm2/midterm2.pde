import ddf.minim.*;
import ddf.minim.analysis.*;
float y;

Minim minim;
AudioPlayer player;
BeatDetect detector;

void setup() {
  size(640, 360);
  background(255);
    
  minim = new Minim(this);
  player = minim.loadFile("DEMIMONDE_boone.mp3");
  detector = new BeatDetect();
}      

void draw()
{
  background(18,9,108);
  
        // hilma af klint arcs
       
 //circle 1 white and blue
 
   fill (224,218,208);
  arc(width/2, height/2, 300, 300, -PI/2+ mouseX/10.0, PI/2+ mouseX/10.0, PIE);
   fill (96,143,192);
   arc(width/2, height/2, 300, 300,PI+ -PI/2+ mouseX/-10.00, PI+ PI/2+ mouseX/-10.00, PIE);

 //circle2 black and yellow
 
 fill (227,186,96);
  arc(width/2, height/2, 200, 200, PI+ -PI/2+ mouseX/-12.00, PI+ PI/2+ mouseX/-12.00, PIE);

 fill (42,42,42);
 arc(width/2, height/2, 200, 200, -PI/2+ mouseX/8.00, PI/2+ mouseX/8.00, PIE);

fill (231,153,130);
 arc(width/2, height/2, 100, 100, PI+ -PI/2+ mouseX/-10.0, PI+ PI/2+ mouseX/-10.0, PIE);
 
  stroke(9,188,18);
  detector.detect(player.left);
  //how do i turn this into a class or an array?
   if (detector.isOnset()){
    fill (255, 195, 0);
    circle(200, 300, 150);
   }
   
   if (detector.isOnset()){
    fill (255, 87, 51);
    circle(200, 300, 100);
   }
    
  if (detector.isOnset()){
    fill (255, 87, 51);
    circle(250, 250, 100);
  }
  
  if (detector.isOnset()){
    fill (218, 247, 166);
    circle(350, 150, 40);
  }
    if (detector.isOnset()){
      fill (88, 24, 69); 
      circle (350, 150,20);
    }
    
    if (detector.isOnset()){
      fill (249, 46, 249); 
      circle (300, 200,75);
    }
    if (detector.isOnset()){
    fill (218, 247, 166);
    circle(200, 300, 60);
   }

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
    stroke (255, 195, 0);
    circle( x1, x1, 20 + player.right.get(i)*50);
    stroke (199,0,57);
    circle (x1, 250, 10 + player.right.get(i)*50);
    circle (x1, x1, 15 + player.right.get(i)*50);
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
