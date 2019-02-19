// definition of the GameObj class
class GameObj {

  // fields
  float x;
  float y;
  float sx;
  float sy;
  float size;
  boolean isActive=true;
  color sc = strokeColor;
  color fc = fillColor;

  //consturctors
  GameObj() {
    x= random(width);
    y = random(height);
    sx = random(-2.5, 2.5);
    sy = random(-2.5, 2.5);
    size = globalSize;
    isActive = true;
  }

  //moethods

  void update() { 
    // increment the X and Y positions by the speed value
    x += sx;
    y += sy;
  }

  void wrap() {
    // keep the GameObj on screen by wrapping it around the edges
    x+=width;
    x%=width;
    y+=height;
    y%=height;
  }

  void render() {
    stroke(strokeColor);
    fill(fillColor);
    ellipse(x, y, size, size);
  }

  // the distance between two points is the length of the hypotenuse of a right triangle formed between them
  // (x^2 + y^2)^0.5 where x is equal to x2 - x1 and y is equal to y2 - y1
  // see http://www.math.info/Algebra/Distance_Cartesian_Plane/
  boolean isClicked(float _x, float _y) {
    return pow( pow( _x - x, 2) + pow( _y - y, 2), 0.5) < size/2;
  }
}
