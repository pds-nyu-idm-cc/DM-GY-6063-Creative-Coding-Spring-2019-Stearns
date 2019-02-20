man man; //calling astronaut class 
astroid[] astroid = new astroid[12];

boolean moveRIGHT = false; // not moving when loaded man(astronaut)
boolean moveLEFT = false; // not moving when loaded man(astronaut)

boolean gameEnded = false; // game not running 


void setup(){
 
  size(840,620);
  background(0);
  noStroke(); 
  
  //calls the astronaut
  man = new man();
  
  for (int i = 0; i < astroid.length; i++){ //calls astroid array  
  astroid[i] = new astroid();
  }
 
 }
 
void draw(){
  
  // draws the man & moves (aka astronaut)  
  man.display();
  man.move();
  if (gameEnded == false) {
    for (int i = 0; i < astroid.length; i++){ // draws the number of astroid & speed
        astroid[i].fall();
     
        
        if (astroid[i].y > man.y1 && astroid[i].x > man.x1 && astroid[i].x < man.x1 + 75){
          //println("collide");
          gameEnded = true;
        }
      
       
         astroid[i].display();
       }
  }else {
     for (int i = 0; i < astroid.length; i++){
        astroid[i].display();
     }
       fill(255);
      text("Game End", width/2,height/2 );
      textSize(50);
      
    }
        
   //opacity (fading it in and out)
  fill(0,90);
  rect(0,0, width, height);
  
  //star bg circle color & location
  fill(255);
  ellipse(random(width), random(height), 7, 7);
  
 
}
  
void keyPressed(){//moves when right or left is pressed
    if (key == CODED){
      if (keyCode == RIGHT){
      moveRIGHT = true; 
    } else if (keyCode == LEFT){
      moveLEFT = true;
    }
  }
}

void keyReleased(){// does not move when keys are not pressed 
  if (key == CODED){
    if (keyCode == RIGHT){
    moveRIGHT = false;
    }else if (keyCode == LEFT){
     moveLEFT = false;
    }
  }
}
  
  
  
  
