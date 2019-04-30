
    
float x=100;
float y=100;
float size=50;
boolean isClicked=false;

float x1=250;
float y1=250;
float size=50;

float circleStrokeWeightInactive=1;
color circleStrokeColorInactive=color(0);
color fillColorInactive=color(240, 154, 13);

float circleStrokeWeightHighlighted=0;
color circleStrokeColorHighlighted=color(240, 154, 13);
color fillColorHighlighted=color(255);

float circleStrokeWeightPressed=1;
color circleStrokeColorPressed=color(255);
color fillColorPressed=color(100, 15, 16);

color backgroundColor=color(240, 13, 154);

float circleStrokeWeightInactive=1;
color circleStrokeColorInactive=color(0);
color fillColorInactive=color(127);

float circleStrokeWeightHighlighted=0;
color circleStrokeColorHighlighted=color(127);
color fillColorHighlighted=color(255);


color backgroundColor=color(0);


void setup() {
  size(500, 500);
  background(backgroundColor);

}

void draw() {
  background(backgroundColor);
  drawCircle();
  fill(0, 102, 153);
  text("flower", 10, 30); 
}
  

void drawCircle() {
  styleCircle(circleLogic());
  circle(x, y, size);
}

void styleCircle(int _mode) {
  //_mode KEY 0 = inactive, 1 = highlighted, 2 = pressed

  switch(_mode) {
  case 0: // inactive
    strokeWeight(circleStrokeWeightInactive);
    stroke(circleStrokeColorInactive);
    fill(fillColorInactive);
    break;
  case 1: // highlighted
    strokeWeight(circleStrokeWeightHighlighted);
    stroke(circleStrokeColorHighlighted);
    fill(fillColorHighlighted);
    break;
  case 2: // pressed
    strokeWeight(circleStrokeWeightPressed);
    stroke(circleStrokeColorPressed);
    fill(fillColorPressed);
    break;
  default:
    strokeWeight(circleStrokeWeightInactive);
    stroke(circleStrokeColorInactive);
    fill(fillColorInactive);
    break;
  }
}

int circleLogic() {


  if (isClicked) {
    if (mouseIsOver()) {
      if (mousePressed) {
        return 0; // pressed
      } else {
        return 1; // highlighted
      }
    } else {
      return 2; // inactive
    }
  } else {
    if (mouseIsOver()) {
      if (mousePressed) {
        return 2; // pressed
      } else {
        return 1; // highlighted
      }
    } else {
      return 0; // inactive

  if (mouseIsOver()) isClicked=!isClicked;
}
  }

  return (dist(x, y, mouseX, mouseY) < size/2);
  

  drawCircle();
}

void drawCircle1() {
  styleCircle1(mouseIsOver());
  circle1(x1, y1, size);
}

void styleCircle1(boolean _mouseIsOver) {

  if (_mouseIsOver) {
    // highlighted
    strokeWeight(circleStrokeWeightHighlighted);
    stroke(circleStrokeColorHighlighted);
    fill(fillColorHighlighted);
  } else {
    // inactive
    strokeWeight(circleStrokeWeightInactive);
    stroke(circleStrokeColorInactive);
    fill(fillColorInactive);
  }
}

boolean mouseIsOver() {
  return (dist(x1, y1, mouseX, mouseY) < size/2);
}
