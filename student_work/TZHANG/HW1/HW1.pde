void setup(){
  size(1000, 1000);
  background(#FFE9E3);    // Setting the background to white
}

void draw(){ 
  fill(#00FF00);
  rect(0,800,1000,200); // Drawing the rectangle
  
  fill(#92332a);
  rect(100,400,500,400); // Drawing the rectangle
  
  fill(#00ffff);
  rect(150,500,100,100); // Drawing the rectangle
  
  fill(#cc0099);
  rect(350,650,100,150); // Drawing the rectangle
  
  fill(#F9F7C7);
  triangle(100, 400, 600, 400, 350,150);
  
}
