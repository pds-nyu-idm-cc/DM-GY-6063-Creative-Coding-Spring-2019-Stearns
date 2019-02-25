class man {

  PImage man;// image of the astronaut 
  float x1; // x position 
  float y1; // y position
  String move; //comparing right & left movement
  float speed = 6; //speed the astronaut moves 
  
man(){
  
  x1 = width/2; //location where astronaut man is
  y1 = height-170;
  
  }
  
void display(){ //showing the astronaut at bottom of screen 
  
  man = loadImage("astronaut.png");
  man.resize(75,155);//size of astronaut 
  image(man,x1,y1); 
    
  }
  
 void move(){ // using boolean (true/false) key pressed & release 
 
    if (moveRIGHT && x1 < width-85) { 
      x1 += speed; // 
    }
    if (moveLEFT && x1 > 0){ 
      x1 -= speed;
    }
  }
 }
  
