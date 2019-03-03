float circlex;
float circley;
float circler;

void setup(){

  size(600,600);
  background(255);
  
  circlex = width/2;
  circley = height/2;
  circler = 100;
 

}

void draw(){
  
  if(dist(mouseX,mouseY, circlex,circley)< circler){
    fill(255,0,0);
  }else{
    fill(0,75,90);  
  }

  ellipse(circlex,circley, circler*2,circler*2);
}
