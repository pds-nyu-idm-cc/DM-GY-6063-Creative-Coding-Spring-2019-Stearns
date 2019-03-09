float circlex;
float circley;
float circler;
//did not make it this far to toggle :(
boolean mouseOver = false;

void setup(){

  size(600,600);
  background(255);
  
  circlex = width/2;
  circley = height/2;
  circler = 100;
 

}

void draw(){
  
  noStroke();
  
  if(dist(mouseX,mouseY, circlex,circley) < circler){
    fill(255,0,0);
  }else{
    fill(0,75,90);  
  }

  ellipse(circlex,circley, circler*2,circler*2);
  
  if(mousePressed){
    fill(180,100,180);
  }
  
  ellipse(circlex,circley, circler*2,circler*2);
  
  
  void mouseOver(){
  
    
  }
  
}
