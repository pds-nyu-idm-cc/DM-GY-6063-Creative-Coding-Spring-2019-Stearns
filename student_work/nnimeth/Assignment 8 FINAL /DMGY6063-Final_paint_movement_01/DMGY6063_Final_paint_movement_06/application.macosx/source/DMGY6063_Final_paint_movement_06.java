import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DMGY6063_Final_paint_movement_06 extends PApplet {

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

SoundFile file;

 ArrayList<Circle> circles; //array of class Circle 
 
 boolean onPressed, showInstrustions;

public void setup() {
  
  //looping the song 
  file = new SoundFile(this, "Voyage-Dynamic.mp3");
  file.loop();
  
  //size(800, 500);
  
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

public void draw(){
    
  
    background(255);
    
    // showing instrstions 
     if(showInstrustions){
    
      fill(128);
      textAlign(CENTER, CENTER);
      text("Click and drag to draw", width*0.5f, height*0.5f);
 
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
public void mousePressed(){
  onPressed = true;
  if (showInstrustions){
    background(255);
    showInstrustions = false;
  }

}

// press any key to save a frame 
public void keyPressed(){
  
  saveFrame("watercolor####.png");
  
}


//click and drag to make new circles 
 public void mouseDragged(){
 
   circles.add(new Circle());
 
 }
class Circle {
 
  PVector acc;
  PVector vel;
  PVector pos;
  float x;
  float y;
  float speed=.9f;
  float r = random(20-250);
  
  float life = 255; //fading the circle to white 
  
  int c;
 
 
    Circle (){
      
      x = mouseX; //using mouse x & y positions 
      y = mouseY;
      pos = new PVector (x,y);
      vel = new PVector (random(-10,20),random(-10,20)); // how fast its moving  
      acc = new PVector(0,0);
      
      c = color(random(20,30), random(220,225), random(120,255),70);
      
      }

  public void move(){
        
        // making the circles on screen move in different directions
        pos.add(vel);
        vel.mult(speed); //speed the circles are coming out 
        vel.add(acc);
        
        r += (noise(frameCount/6.0f))*3;
        
        if (pos.y > height){
          vel.y = -vel.y;
        }
        
        // adding delta mult moves circles away from mouse 
        PVector delta = new PVector(mouseX, mouseY);
        delta.sub(pos);
        delta.normalize();
        delta.mult(-3.5f); // how fast it "runs away" from mouse 
        pos.add (delta);
        
        r *=1;
    
    
    }

  public boolean done(){
    // circles fade out 
    life--;
    if (life < 0){
      return true;
    }else {
     return false;
    }
  }
  

  public void display(){
   
    fill(c,life);
    ellipse(pos.x, pos.y, r, r);
    
  }


}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "DMGY6063_Final_paint_movement_06" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
