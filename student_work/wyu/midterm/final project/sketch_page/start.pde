class botton {

  color c;
  float recX1= width/2;
  float recY1= height-146;
  float h1=10;
  float h2=18;
  float w1=5;
  float w2=7;
  float recX2= width/2;
  float recY2= height-140;
  botton() {
    c=color(#ef5751);
  }
  void display()
  {
    fill(c);
    rectMode(CENTER);
    noStroke();
    rect(recX1, recY1, h1, w1);
    rect(recX2, recY2, h2, w2);
  }
  void pop() {
    if (mousePressed == true) {
      w1=w1-3;
    } else {
      c = color(255, 0, 0);
    }
  }
}
