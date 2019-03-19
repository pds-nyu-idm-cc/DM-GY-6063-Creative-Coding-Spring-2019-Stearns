// declare an instance of a CircleObject named circle1
CircleObject circle1;

void setup(){
  size(500,500);
  background(255);
}

void draw(){
  background(255);
  // if an instance is not assigned to circle1
  // then it is "null" and we can't do anything to something that
  // does not exist...
  if (circle1 != null){
    circle1.update();
    circle1.render();
  }
}

void mousePressed(){
  // when we click the mouse, we create a new instance of a CircleObject
  // then assigne it to circle1
  circle1 = new CircleObject(mouseX, mouseY, 5, color(125,64,254));
}

///////////////////////////////////////
// difinition of the Circle Object
class CircleObject {

  // these variables are called fields when they're in a class like this
  // we can declare and initialize them just like global variables in a sketch
  float x = 0.0;
  float y = 0.0;
  float radius = 0.0;
  color fillColor = color(0);
  color strokeColor = color(0);
  float strokeWeight = 1.0;
  int age = 0;
  int maxAge = 100;
  float growRate = 3.0;
  boolean noFill = false;
  boolean noStroke = true;

  // next we neet to construct the object
  // think of these as setup() functions that allow us to initialize values
  // or even to pass new values into fields
  
  // ---we can use multiple constructors---

  // default constructor creates an object with the values we defined above
  CircleObject() {
  }

  // if we want to pass other values like location, radius, color,
  // then we have to creat a constructor that will accepts these
  CircleObject(float _x, float _y, float _radius, color _fillColor) {
    x = _x;
    y = _y;
    radius = _radius;
    fillColor = _fillColor;
  }
  
  // a method that describe how the circle changes
  void update(){
    // fading
    fillColor = fade(fillColor, age, maxAge);
    // growing
    radius+=growRate;
    // aging
    if(isAlive())age++;
  }
  
  // a method that draws the object to screen
  void render(){
    
    strokeWeight(strokeWeight);
    fill(fillColor);
    if(noFill) noFill();
    stroke(strokeColor);
    if(noStroke) noStroke();
    
    circle(x, y, 2*radius);
  }
  
  color fade(color _color, int _age, int _maxAge){
    int alpha = int(265 - 256 * _age / float(_maxAge));
    return _color & 0x00FFFFFF | alpha << 24;
  }
  
  boolean isAlive(){
    return age <= maxAge;
  }
  
  boolean isDead(){
    return age > maxAge;
  } 
  
}
