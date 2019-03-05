class Pipe {
  float pipex, pipewidth, pipeUp, pipeDown;
  PImage pipeup;
  PImage pipedown;

  Pipe() {
    pipewidth = 90;
    pipex = empty + pipewidth;
    pipeUp = random(100, (height-50)/2);
    pipeDown = random(100, (height-50)/2);
  }

  boolean collide(Bird b) {
    if ((b.position.x > pipex) && (b.position.x < (pipex + pipewidth))) {
      if ((b.position.y < pipeUp) || (b.position.y > (height - pipeDown))) {
        return true;
      }
    }
    return false;
  }

  void pipeUpdate() {
    int temp = 5;
    //float temp = random(3,6)
    pipex -= temp;
  }

 void checkcollision(boolean collision) {
    noStroke();
    if (collision) {
      gamestage = false;
    } else {
      gamestage = true;
    }  
    pipeup = loadImage("pipeup.png");
    image(pipeup,pipex, 0, pipewidth, pipeUp);
    pipedown = loadImage("pipedown.png");
    image(pipedown, pipex, height - pipeDown, pipewidth, pipeDown);
  }
}
