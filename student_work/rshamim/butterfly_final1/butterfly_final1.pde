//library
import ddf.minim.*;
import ddf.minim.analysis.*;

//Variable/ objects 
PImage img_butterfly; 
PImage backgroundimg;
PImage backgroundimg2;
PImage backgroundimg3;
PImage backgroundimg4;
PImage backgroundimg5;

//float x,y; PVector is a type of object that define relationship x and y as 
//one variable
PVector pos,vel;
 float posPercentage;
 // float eRadius;

Minim minim;
AudioPlayer player;
//BeatDetect detector;
Butterfly butterfly1, butterfly2;
//variable declaration (for array)
ArrayList<Butterfly> butterflies;

//functions
void setup (){
  size (640,640);
  pos= new PVector (width-300,10);
  vel = new PVector (2,1);
  backgroundimg =loadImage ("painting2.jpg");
  backgroundimg2 =loadImage ("painting1.jpg");
  backgroundimg3 =loadImage ("painting3.jpg");
  backgroundimg4 =loadImage ("painting4.jpg");
  backgroundimg5 =loadImage ("painting2.jpg");
  
  butterfly1 = new Butterfly(
  new PVector (random(width), 50)
  );
  butterfly2 = new Butterfly(
  new PVector (50, random(height))
  );
  butterflies = new ArrayList<Butterfly>();
 butterflies.add(butterfly1);
 butterflies.add(butterfly2);
 
 //println(butterflies);

 //butterflies = new Butterfly (new PVector (width-200,200));
  //butterfly2 = new Butterfly (new PVector (width-300,200));
 
 //make an array of butterflies. variable initialization
  //butterflies = new Butterfly[25];

//populate array using forloop. the number of butterflies is equal to size of array
//for (int i = 0; i < butterflies.length; i++){
 // butterflies[i] = new Butterfly(new PVector (random(width), random(height)));

  //pos.x=200;
  imageMode(CENTER);
  
// img_butterfly = loadImage("butterfly_img1.png");

  minim = new Minim(this);
  player = minim.loadFile("song1.wav");  
  //loop audio automatically
  player.loop();
   //detector = new BeatDetect();
   
  // ellipseMode(RADIUS);
   //eRadius = 20;
}

//size of canvas
void draw (){
  
  float posx = map(player.position(), 0, player.length(), 0, width);
  posPercentage = map(player.position(), 0, player.length(), 0, 100);
  
  //beatDetect (doesn't work) PImage
   //detector.detect(player.left);
 //float a = map(eRadius, 20, 80, 60, 255);
  //fill(162, 170, 243, a);
  // if ( detector.isOnset() ){
   //  eRadius = 80;
  //ellipse(width/2, height/2, eRadius, eRadius);
  //eRadius *= 0.95;
  //if ( eRadius < 20 ) eRadius = 20;
  //}  

 fill(0,10);
  rect(0,0,width, height);
  //blend background images together.  Play around with blend, mask, filter. pixels
  backgroundimg.blend(backgroundimg2,0, 0,
                      (int) (width * posPercentage / 100), height,
                     0, 0,
                      (int) (width * posPercentage /100), height, BLEND); 

if (frameCount % 50==0){
   // backgroundimg2.blend(backgroundimg3,0, 0,
   //                  (int) (width * posPercentage /60), height,
   //                 0, 0,
   //                  (int) (width * posPercentage / 60), height, BLEND); 
   //backgroundimg3.blend(backgroundimg4,0, 0,
   //                  (int) (width * posPercentage / 30), height,
   //                 0, 0,
   //                   (int) (width * posPercentage / 30), height, BLEND); 
   //backgroundimg4.blend(backgroundimg5,0, 0,
                     // (int) (width * posPercentage / 120), height,
                    // 0, 0,
                     // (int) (width * posPercentage / 120), height, BLEND); 
  //add new butterflies at playerhead
  Butterfly temp= new Butterfly (new PVector ((int)(width * posPercentage / 25), random(height)));
  butterflies.add(temp);
 }
  image (backgroundimg,width/2,height/2);
  //image (backgroundimg2,width/2,height/2);
  //image(img_butterfly,pos.x,pos.y, 200,200); see below for setup for class/objects
  for(Butterfly butterfly :butterflies){
 butterfly.update ();
 butterfly.draw ();
 // for (int i = 0; i < butterflies.length; i++){
    //butterflies[i].update();
   // butterflies[i].draw();

  //pos.add(vel); read about pushmatrix and popmatrix (restores to original canvas)
  //println(pos);
  pos.x+=2;
  pos.y+=1;  
 }
  }
  //if(mousePressed){
   //Butterfly temp = new Butterfly(
  //new PVector(mouseX, mouseY),
  //new PVector (3,2)
  //);
  //butterflies.add(temp);
// }
//}
  //interaction (play around with player.pos)
 // void mousePressed(){
  

//vectors/ particle motion
//make ArrayList
//make new butterflies based on player position
