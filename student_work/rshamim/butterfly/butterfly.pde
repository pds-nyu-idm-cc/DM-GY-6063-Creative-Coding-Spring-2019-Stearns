//library
import ddf.minim.*;
import ddf.minim.analysis.*;

//Variable/ objects 
PImage img_butterfly; 
PImage backgroundimg;
PImage backgroundimg2;

//float x,y; PVector is a type of object that define relationship x and y as 
//one variable
PVector pos,vel;

  float posPercentage;

Minim minim;
AudioPlayer player;
BeatDetect detector;

Butterfly butterfly1, butterfly2;
//variable declaration (for array)
Butterfly [] butterflies;

//functions
//right click to find reference which allows you to check parameters for the function
void setup (){
  size (1000,600);
  pos= new PVector (width-900,10);
  vel = new PVector (2,1);
  backgroundimg =loadImage ("painting2.jpg");
  backgroundimg2 =loadImage ("painting1.jpg");
  butterfly1 = new Butterfly (new PVector (width-900,200));
  
  butterfly2 = new Butterfly (backgroundimg2,new PVector (width-500,200));
 
 //make an array of butterflies. variable initialization
 butterflies = new Butterfly[(int) random(50,100)];

//populate array using forloop. the number of butterflies is equal to size of array

for (int i = 0; i < butterflies.length; i++){
  butterflies[i] = new Butterfly(new PVector (width-i, 200));
}
  //pos.x=200;
  imageMode(CENTER);
  
  
// img_butterfly = loadImage("butterfly.png");

  minim = new Minim(this);
  player = minim.loadFile("song1.wav");
  //loop audio automatically
  player.loop();
}



//size of canvas
void draw (){
  
  float posx = map(player.position(), 0, player.length(), 0, width);
  posPercentage = map(player.position(), 0, player.length(), 0, 100);
  
  //overlapping the background. you can play around with opacity to get blur effect. 
  //check reference to see variable for transparency
  //background(0,0.5);
  fill(0,10);
  rect(0,0,width, height);
  
  //blend background images together.  Play around with blend, mask, filter. pixels
  backgroundimg.blend(backgroundimg2, width/2, height/2,
                      (int) (600 * posPercentage / 100), 100,
                      width/2, height/2,
                      (int) (600 * posPercentage / 100), 100, OVERLAY); 

  image (backgroundimg,width/2,height/2);
  //image (backgroundimg2,width/2,height/2);
  //image(img_butterfly,pos.x,pos.y, 200,200); see below for setup for class/objects
  butterfly1.draw ();
  butterfly2.draw ();
for (int i = 0; i < butterflies.length; i++){
  butterflies[i].draw();
}
  //pos.add(vel); read about pushmatrix and popmatrix (restores to original canvas)
  println(pos);
  pos.x+=2;
  pos.y+=1;
  
  

  
}

//vectors/ motion
