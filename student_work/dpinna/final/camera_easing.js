let cam1, cam2;
let currentCamera;
let side = 400;
let posEasing = 0.125;
let focEasing = 0.25;

var cam1CurrentPos = [0.0, 0.0, 0.0];
var cam1CurrentFoc = [0.0, 0.0, 0.0];

var cam1TargetPos = [0.0, 0.0, 520.0];
var cam1TargetFoc = [0.0, 0.0, -side / 2];

function preload() {
  text_font = loadFont('static/Roboto.otf');
}

function setup() {
  createCanvas(1200, 600, WEBGL);
  cam1 = createCamera();
  // cam2 = createCamera();

  currentCamera = 1;
  textFont(text_font, 50);
  textAlign(CENTER, CENTER);
}

function draw() {
  // orbitControl();
  background(200);
  drawBoxes();

  // showAxis(0.0, side, side);

  for (var i = 0; i < 3; i++) {
    cam1CurrentPos[i] += ease(cam1CurrentPos[i], cam1TargetPos[i], posEasing);
    cam1CurrentFoc[i] += ease(cam1CurrentFoc[i], cam1TargetFoc[i], focEasing);
  }

  cam1.setPosition(cam1CurrentPos[0], cam1CurrentPos[1], cam1CurrentPos[2]);
  cam1.lookAt(cam1CurrentFoc[0], cam1CurrentFoc[1], cam1CurrentFoc[2]);

}

function keyTyped() {
  switch (key) {
    case 'd':
      cam1TargetPos = [-300.0, 0.0, 0.0];
      cam1TargetFoc = [-side / 2, 0.0, 0.0];
      break;
    case 's':
      cam1TargetPos = [0.0, 0.0, 500.0];
      cam1TargetFoc = [0.0, 0.0, -side / 2];
      break;
    case 'a':
      cam1TargetPos = [300.0, 0.0, 0.0];
      cam1TargetFoc = [side / 2, 0.0, 0.0];
      break;
    case 'x':
      cam1TargetPos = [0.0, -500.0, 0.0];
      cam1TargetFoc = [0.0, 0.0, -side / 2];
      break;

  }
}

// simple
function ease(_current, _target, _factor) {
  return (_target - _current) * _factor;
}


function drawBoxes() {
  // you should actually be able to change how you draw this
  // so that it's easier to target faces
  // maybe a Face class?

  //custom build a cube to have faces coloured differently
  noStroke();
  beginShape();
  //front
  fill(0, 92, 161)
  vertex(-side, -side, -side)
  vertex(-side, side, -side)
  vertex(side, side, -side)
  vertex(side, -side, -side)
  endShape();
  beginShape();
  //bottom
  fill(0, 150, 50)
  vertex(-side, side, -side)
  vertex(side, side, -side)
  vertex(side, side, side)
  vertex(-side, side, side)
  endShape();
  //side-right
  fill(250, 150, 0)
  vertex(side, -side, -side)
  vertex(side, -side, side)
  vertex(side, side, side)
  vertex(side, side, -side)
  endShape();
  beginShape();
  //side-left
  fill(150, 50, 50)
  vertex(-side, -side, -side)
  vertex(-side, -side, side)
  vertex(-side, side, side)
  vertex(-side, side, -side)
  endShape();

  // Show Text in each face
  // implement this to get hover text and click interaction?
  // https://p5js.org/examples/interaction-tickle.html
  // and this for mousePressed()
  // https://p5js.org/examples/hello-p5-interactivity-1.html

  textSize(50);
  fill(0);
  translate(0, 0, -side + 1)
  text('Welcome', 0, 0);
  translate(0, 100, 0);
  textSize(30);
  text('Press S', 0, 0);
  translate(0, -100, 0);

  fill(255, 250, 250);
  translate(-side + 1, 0, side);
  rotateY(radians(90));
  textSize(50);
  text('Option A', 0, 0);
  translate(0, 100, 0);
  textSize(30);
  text('Press a', 0, 0);
  translate(0, -100, 0);
  rotateY(radians(-90));

  fill(255, 250, 250);
  translate((side * 2) - 2, 0, 0)
  rotateY(radians(-90));
  textSize(50);
  text('Option B', 0, 0);
  translate(0, 100, 0);
  textSize(30);
  text('Press d', 0, 0);
  rotateY(radians(90));
  translate(0, -100, 0);

  fill(255, 250, 250);
  translate(-side, side - 1, -side / 1.5)
  rotateX(radians(90))
  textSize(50);
  text('Option C', 0, 0);
  translate(0, 50, 0);
  textSize(30);
  text('Press x', 0, 0);

}

// now you cam place this at the origin of anything!
function showAxis(_x, _y, _z) {
  strokeWeight(5)
  //x
  stroke(153, 0, 0)
  line(0 + _x, 0 + _y, _z, 100 + _x, 0 + _y, _z)
  //y green
  stroke(34, 204, 0)
  line(0 + _x, 0 + _y, _z, 0 + _x, -100 + _y, _z)
  //z
  stroke(110, 150, 210)
  line(0 + _x, 0 + _y, 0 + _z, 0 + _x, 0 + _y, 100 + _z)
}
