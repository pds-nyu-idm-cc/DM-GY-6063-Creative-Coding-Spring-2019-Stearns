float x=250;
float y=250;
float size=50;

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
}

void drawCircle() {
  styleCircle(mouseIsOver());
  circle(x, y, size);
}

void styleCircle(boolean _mouseIsOver) {

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
  return (dist(x, y, mouseX, mouseY) < size/2);
}
