class Rect {

  float xTop;
  float yTop;
  float xBottom;
  float yBottom;

  Rect() {
    xTop = 50;
    yTop = 50;
    xBottom = 50;
    yBottom = 400;
  }

  void display() {
    noStroke();

    fill(colorTop);
    rect(xTop, yTop, 300, 300); //top

    fill(colorBottom);
    rect(xBottom, yBottom, 300, 150);  //bottom
  }
  
}
