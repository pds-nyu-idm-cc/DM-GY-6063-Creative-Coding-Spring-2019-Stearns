

class Car {

  float x = random(width);
  float y = random(height);
  float size = 100;
  float w = size;
  float h = size/3;
  float wheelSize = size/4;
  float wheelBase = 0.325;
  float wheelHeight = 0.45;
  String name = new String("noname");
  color fillColor = color(255);
  color textColor = color(255, 0, 0);


  Car() {
  }

  Car(float _x, float _y) {
    x = _x;
    y = _y;
  }

  Car(String _name) {
    name = _name;
  }

  Car(float _x, float _y, String _name) {
    x = _x;
    y = _y;
    name = _name;
  }

  Car(float _x, float _y, float _size, String _name) {
    x = _x;
    y = _y;
    this.setSize(_size);
    name = _name;
  }

  void setSize(float _newSize) {
    size = _newSize;
    w = size;
    h = size/3;
    wheelSize = size/4;
  }

  void display() {

    pushMatrix();
    // move the origin to where the Car is
    translate(x, y);
    // draw car body
    rectMode(CENTER);
    fill(fillColor);
    rect(0, 0, w, h);
    // draw some wheels
    textAlign(CENTER, TOP);
    circle(-wheelBase * w, wheelHeight * h, wheelSize);
    circle(wheelBase * w, wheelHeight * h, wheelSize);
    // draw name on car
    fill(textColor);
    text(name, 0, h/2);
    popMatrix();
  }

  boolean isClicked(float _x, float _y) {   
    return (( _y > y-h/2 && _y < y+h/2 ) && ( _x > x-w/2 && _x < x+w/2 ));
  }
}
