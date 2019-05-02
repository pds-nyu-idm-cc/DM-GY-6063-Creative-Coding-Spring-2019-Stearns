PImage img_balloon;
//float x,y;
PVector pos, vel;
Balloon balloon1, balloon2;

PVector pos1;
ArrayList<Star> stars;


void setup(){
  size(1000,1000);
  pos1= new PVector (width/2, height/2);
  pos = new PVector(200,100);
  vel = new PVector(2,1);
  pos.x= 200;
  
  stars = new ArrayList<Star>();
  
  for ( int i=0; i<10; i++){
     //Che-Yu showed me how to generate new star object and put them into an Array list with random start position and 0 velocity 
  stars.add(new Star (    new PVector(random(width), random(height)) , new PVector(0,0)  ));
  }
  
  balloon1= new Balloon();
  balloon1.pos= new PVector(200,100);
  balloon1.img =loadImage ("HotAir.jpg");
  balloon1.pos.x =200;
  
  balloon2= new Balloon();
  balloon2.pos= new PVector(200,500);
  balloon2.img =loadImage ("HotAir.jpg");
  //balloon2.pos.x =200;
  
  imageMode(CENTER);
  img_balloon = loadImage( "HotAir.jpg" );
  }

void draw(){
  background(0);
  fill(0, 10);
  rect(0,0,width, height);
  //cloud
  fill(255);
  noStroke();
  ellipse(400,400,100,100);
  ellipse(450,350,100,100);
  ellipse(550,450,100,100);
  translate (-frameCount,0);
  fill(frameCount%50>40?255:0);
  ellipse(1000,height/2,50,50);
  ellipse(800,height/2+200,50,50);
  ellipse(900,height/2-200,50,50);
  ellipse(200,height/2,50,50);
  
  fill(255,0,0);
  ellipse(pos.x, pos.y,50,50);
  
  for( Star star  :stars){
    //update star position
  star.update();
    
    //draw the star on canvas
  star.draw();
  
  balloon1.draw();
  balloon2.draw();
  
  pos.x+= 2;
}

  pos.x = frameCount + width/2;
  pos.y = sin(frameCount/100.0)*50+ noise(frameCount/100.0)*50+height/2;
}
