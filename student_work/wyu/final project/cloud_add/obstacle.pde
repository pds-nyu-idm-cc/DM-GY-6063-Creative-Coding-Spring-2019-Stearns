class Tube {
  float x;
  float y;


  boolean clear;
  float scroll;
  float w;

  Tube() {
     x=width/2;
    y = random(100, 220);
    clear = false;
    w = 50;
  }

  //void update() {
  //  resetMatrix();
  //  int xpos = floor(scroll - x);
  //  xpos = 400 - xpos;
  //  int ypos = (int)y;
  //  rect(xpos, ypos,w,w);
  //  if (clear == false && xpos <= 50) {
  //    clear = true;
  //    }
  //  }

  //  boolean finished() {
  //    int xpos = floor(scroll - x);
  //    xpos = 400 - xpos;
  //    if (xpos <= -100) {
  //      return true;
  //    } else {
  //      return false;
  //    }
  //  }
  ////}
  void display() {
    fill(0);
    rect(x, y, w, w);
  }
  void accend() {
    x--;
  }
  boolean isCollison() {
    if (bird.location.x == x) {
      return true;
    }else {
    return false;}
  }
}
