int brushId = 1;

PImage brush1;
PImage brush2;
PImage brush3;

void setup(){
  
    // set up screen 
    fullScreen();
    //size(700,700);
    background(255);
    noStroke();
    blendMode(MULTIPLY);
    
    // setup brush 
    
    frameRate(160);
    brush1= loadImage("brush1.png"); // Start with image 1 
    brush2= loadImage("brush2.png");
    brush3= loadImage("brush3.png");
    imageMode(CENTER);
    last= new PVector(mouseX,mouseY);  
    // drawing based on last placement of x y mouse position
}

PVector last; // based on the last position

void draw(){

    noStroke();
    smooth();    
    PVector current = new PVector(mouseX,mouseY);
    PVector delta = PVector.sub(current,last).mult(0.08);
    float drawingDegree = current.sub(last).heading();
    
    for(float d=0; d <=10; d += 1){
      pushMatrix();
      
      last.add(delta);
      
      if (mousePressed){
      
         translate(last.x,last.y);
         rotate(drawingDegree);
        
        
         if (brushId==1){
           image(brush1,0,0,10,30);
           println("brush 1");
         }else if (brushId == 2){
           image(brush2,0,0,35,35);
           println("brush 2");
         }else if (brushId == 3){
           image(brush3,0,0,10,10);
           println("brush 3");
         }
      
      }
    
      popMatrix();
    
    
    }
    

}

void keyPressed(){
  brushId = int(key-48);
    if (key == 'e')
   {
     background(255);
  }
  
}

void mousePressed(){
  
  last= new PVector(mouseX,mouseY);
  
}
