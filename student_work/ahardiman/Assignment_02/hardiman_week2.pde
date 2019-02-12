int x = 50;
int y = 450;

void setup(){
  size(500, 500);
  background(50);
}

void draw(){
  circle(x,y,50);
}
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        y -= 10;
    } else if (keyCode == DOWN) {
        y += 10;
    } else if (keyCode == LEFT) {
        x -= 10;
    } else if (keyCode == RIGHT) {
        x += 10;
    }
    }
  }
  
  void mousePressed() {
   x = 50;
   y = 450;
   background(50);
   redraw();
    }
  
  
 
