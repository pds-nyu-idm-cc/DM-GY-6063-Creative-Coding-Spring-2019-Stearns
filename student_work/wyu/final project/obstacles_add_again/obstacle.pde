class Tube {
  float x;
  float y;

  boolean clear;
  float scroll;
  float w;

  Tube() {
    x = width/2;
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
//      //score += 1;
//      //playSound("point.ogg");
//    }
//  }
//  //  boolean isColliding() {
//  //  int xPos = floor(scroll - x);
//  //  xPos = 400 - xPos;
//  //  int yPos = (int)y;
//  //  if (player.getTop() < yPos + 270 || player.getBottom() > 390 + yPos) {
//  //    if (player.getRight() > xPos && player.getLeft() < xPos + 52) {
//  //      dead = true;
//  //      if (died == false) {
//  //        playSound("hit.ogg");
//  //        died = true;
//  //        if (player.yVel < 2) {
//  //          player.yVel = 0; 
//  //        } else {
//  //          player.yVel = 2;
//  //        }
//  //      }
//  //      return true;
//  //    }
//  //  }
//  //  return false;    
//  //}
  
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
    }
