void setup(){

  // set screen size
  size(100, 100);
  
  // set starting background color
  background(255);
}

void draw(){
  
  // blank out canvas
  background(255);
  
}

void keyPressed(){
  println("Key pressed: "+key);
  println("Keycode pressed: "+keyCode);
}
