class Button {
  float x, y;
  float dx, dy, targetX = width/2, targetY=125, easing = 0.05;
  color c;
  String s;
  
  Button(float newX, float newY, color newC, String newS) {
    x = newX;
    y = newY;
    c = newC;
    s = newS;
    //loop();
  }

  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y , 60, 60);
    textAlign(CENTER);
    textSize(10);
    fill(0);
    text(s, x, y+5);
  }

  void choose() {
    
    //dx = targetX - x;
    //x += dx * easing;
    
    //dy = targetY - y;
    //y += dy * easing;
    
    x = targetX; y = targetY;


    println("X: "+targetX+", Y: "+targetY);  
    println("dx: "+dx+", dy: "+dy);
  }
}
