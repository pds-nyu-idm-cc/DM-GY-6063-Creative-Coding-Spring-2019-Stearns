float x;
float y;
float size;
boolean clicked;

float circleStrokeWeightInactive;
color circleStrokeColorInactive;
color fillColorInactive;

float circleStrokeWeightHighlighted;
color circleStrokeColorHighlighted;
color fillColorHighlighted;

float circleStrokeWeightPressed;
color circleStrokeColorPressed;
color fillColorPressed;


void setup() {
  size(500, 500);
}

void draw() {

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
