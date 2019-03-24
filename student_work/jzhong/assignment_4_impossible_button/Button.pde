class Button {
  float x, y, x2, y2;
  float dx, dy, targetX, targetY, easing = 0.08;
  color c;
  String s;

  Button(float newX, float newY, color newC, String newS) {
    x = newX;
    y = newY;
    c = newC;
    s = newS;
    x2 = newX;
    y2 = newY;
    //loop();
  }

  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, 66, 66);
    textAlign(CENTER);
    textSize(10);
    fill(0);
    text(s, x, y+5);
  }

  void choose() {
    targetX = width/2;
    targetY = 125;

    dx = targetX - x;
    x += dx * easing;

    dy = targetY - y;
    y += dy * easing;


    //println("X: "+targetX+", Y: "+targetY);  
    //println("dx: "+dx+", dy: "+dy);
  }

  void reset() {
    targetX = x2;
    targetY = y2;

    dx = targetX - x;
    x += dx * easing;

    dy = targetY - y;
    y += dy * easing;
  }
}
