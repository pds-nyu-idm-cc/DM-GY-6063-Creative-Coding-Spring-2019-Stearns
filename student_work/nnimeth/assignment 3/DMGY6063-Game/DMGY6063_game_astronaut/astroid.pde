class astroid{

  PImage astroid;
  float x = random(width);
  float y = random(-200,-100);
  float yspeed = random(1,4);
  float size = random(10,40);


  void fall(){ // the speed how fast the astroid is falling
  
    y = y + yspeed;
    yspeed = yspeed + 0.05;
    
    if(y > height) { // looping the astriods once is hits the bottom 
     y = random(-200,-100);
     yspeed = random(1,4);
    }
    
  }

void display(){

  astroid = loadImage("astroid.png");
  astroid.resize(40,40);//size of astronaut 
  image(astroid,x,y); 
  
}



}
