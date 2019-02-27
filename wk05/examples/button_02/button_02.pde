float x=250;
float y=250;
float size=50;
boolean clicked;

float circleStrokeWeightInactive=1;
color circleStrokeColorInactive=color(0);
color fillColorInactive=color(127);

float circleStrokeWeightHighlighted=0;
color circleStrokeColorHighlighted=color(127);
color fillColorHighlighted=color(255);

float circleStrokeWeightPressed=1;
color circleStrokeColorPressed=color(255);
color fillColorPressed=color(0);

color backgroundColor=color(0);

void setup() {
  size(500, 500);
  background(backgroundColor);
}

void draw() {
background(backgroundColor);
  drawCircle();
}

void drawCircle() {
  styleCircle(circleLogic());
  circle(x,y,size);
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

  if (mouseIsOver()) {
    if (mousePressed) {
      return 2; // pressed
    } else {
      return 1; // highlighted
    }
  } else {
    return 0; // inactive
  }
}

boolean mouseIsOver() {
  return (dist(x, y, mouseX, mouseY) < size/2);
}
