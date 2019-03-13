var x;
var y;
var createCanvas;
var clicked;

var circleStrokeWeightInactive;
color circleStrokeColorInactive;
color fillColorInactive;

var circleStrokeWeightHighlighted;
color circleStrokeColorHighlighted;
color fillColorHighlighted;

var circleStrokeWeightPressed;
color circleStrokeColorPressed;
color fillColorPressed;


function setup() {
  createCanvas(500, 500);
}

function draw() {

  drawCircle();
}

function drawCircle() {
  styleCircle(circleLogic());
  circle(x,y,createCanvas);
}

function styleCircle(var _mode) {
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

var circleLogic() {

  if (mouseIsOver()) {
    if (mouseIsPressed) {
      return 2; // pressed
    } else {
      return 1; // highlighted
    }
  } else {
    return 0; // inactive
  }
}

var mouseIsOver() {
  return (dist(x, y, mouseX, mouseY) < createCanvas/2);
}