int x=250;
int y=250;
int bgcolor = 0;
void setup(){

  // set screen size
  size(500, 500);
  
  // set starting background color
  background(255);

}

void draw(){
  background(bgcolor);
  bgcolor++;
  // blank out canvas
  
  
  // style our shape
  strokeWeight(1);
  stroke(0);
  fill(127);
  
  // draw shape
  //triangle(425,375,400,400,450,400);
  //triangle(450,400,475,425,450,450);
  //triangle(450,450,425,475,400,450);
  //triangle(400,450,375,425,400,400);
  ellipse(x,y,20,20);
  
  
}

void keyPressed(){
  println("Key pressed: "+key);
  println("Keycode pressed: "+keyCode);
  
  if (keyCode == 38){
   for(int counter = 0; counter < 10; counter++){ 
    y = y - 1;
   }
  }else if (keyCode == 40){
    y = y + 10;
  }else if (keyCode == 37){
    x = x - 10;
  }else if (keyCode == 39){
    x = x + 10;
  }
    
}
