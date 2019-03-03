void wallDetection() {
  if (a < width/8 + r) {
    a = width/8 + r;
    //moveA= random(-10, 10);
    moveA += random(-3, 3);
    moveA= -moveA;
  }
  if (a > width*7/8 - r) {
    a = width*7/8 - r;
    //moveA= random(-10, 10);
    moveA += random(-3, 3);
    moveA = -moveA;
  }
  if (b < height/8 + r) {
    b = height/8 + r;
    moveB = -moveB;
  }
  if (b > height*7/8 - r) {
    b = height*7/8 - r;
    //moveB--;
    moveB = -moveB;
    life--;
    
  }
}
