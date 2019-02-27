void juggleBlock() {
  stroke(j);
  line((mouseX - 2*r)*o, mouseY, (mouseX + 2*r)*o, mouseY);
  //juggler detection
  if ((b == mouseY-r)  && (a < mouseX+2*r) && (a > mouseX-2*r) && (moveB>0) ) {
    b = mouseY;
    moveB=-moveB;
    score++;
  }
}
