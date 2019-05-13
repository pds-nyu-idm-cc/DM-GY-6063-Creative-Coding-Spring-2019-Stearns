/* 

 Click and drag to make the circles appear on the screen. 
 To interact with the bubbles once the appear move the 
 mouse around without clicking
 Circles will run away from the mouse
 
 To save a image: use any key 
 
 NOTE: it takes a minute to load, not sure if its my computer, the song
 also starts out slow and at low volume but becomes louder further into 
 the song 
 
 song: Voyage by Dynamic 
 
 */
 
//add in sound 
import processing.sound.*;
SoundFile file;

 ArrayList<Circle> circles; //array of class Circle 
 
 boolean onPressed, showInstrustions;

void setup() {
  
  //looping the song 
  file = new SoundFile(this, "Voyage-Dynamic.mp3");
  file.loop();
  
  //size(800, 500);
  fullScreen();
  //smooth();
  noStroke();
  colorMode(RGB);
  //background (255);
 
 showInstrustions = true;
 
 //storing circles 
 circles = new ArrayList<Circle>();
 //adding new circles 
 circles.add(new Circle());


}

void draw(){
    
  
    background(255);
    
    // showing instrstions 
     if(showInstrustions){
    
      fill(128);
      textAlign(CENTER, CENTER);
      text("Click and drag to draw", width*0.5, height*0.5);
 
    }
    
    
    // calling the class and updating  
    for (int i = circles.size()-1; i >= 0; i--){
      Circle circle = circles.get(i);
      circle.move();
      circle.display();
      
      //calling fade & removing circles  
      if (circle.done()){
        circles.remove(i);
      }
      
    }

}


// getting rid of the instrustions once the mouse it pressed 
void mousePressed(){
  onPressed = true;
  if (showInstrustions){
    background(255);
    showInstrustions = false;
  }

}

// press any key to save a frame 
void keyPressed(){
  
  saveFrame("watercolor####.png");
  
}


//click and drag to make new circles 
 void mouseDragged(){
 
   circles.add(new Circle());
 
 }
