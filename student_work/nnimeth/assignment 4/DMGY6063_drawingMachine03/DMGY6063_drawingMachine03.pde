
void setup(){

  size(800,800);
  background(255);

}

void draw(){
  
  noStroke();
  
      float x= 0; 
      while(x < width){ // placement of the x & y on the canvas 
        float y = 0;
        while(y < height){  
          if(mousePressed){ //mousepressed changes the colors 
            fill(random(30),random(160), random(180), random(100)); //blue & green
          } else{
            fill(random(200),random(50),random(230),random(110)); //purples, red & pink
              }
            ellipse(x + 40, y + 40, 38, 38); // adding 40px to x & y makes it centered 
            y = y + 80; // making a circle every 80px (height)
             } 
            x = x + 80; }// making a circle every 80px (width)
           
            
}
