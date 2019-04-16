class Circle {
  float x, y, size;
  float dSize, targetSize, easing = 0.05;
  
  
  Circle(float newX, float newY, float newSize) {
    x = newX;
    y = newY;
    size = newSize;
  }
  
  void display () {
    stroke(1);
    fill(255);
    circle(x, y, size);
    circle(x, y, 5);
  }
  
  void animation () {
    //the circle should become smaller after they appear
    //until they are the same size as the smaller circle
    //and I am trying to add easing to the sizing process
    targetSize = 5;
    dSize = targetSize - size;
    size += dSize * easing;
    
  }
  
  
  
  
}
