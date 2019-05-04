let cam1, cam2;
let currentCamera;
let side = 400;
var look_dx;
var look_x = 0;
var pos_x = 0;
var whereToLook;

let easing = 0.5;
var z = 520;
var t1 = 0;
var t2;
var l1 = 0;
var l2;
var whereAmIGoingToLookAt;

function preload() {
  f = loadFont(
    "https://cdnjs.cloudflare.com/ajax/libs/topcoat/0.8.0/font/SourceCodePro-Bold.otf"
  );
}

function setup() {
  createCanvas(1200, 600, WEBGL);
  cam1 = createCamera();
  cam2 = createCamera();

  cam1.lookAt(0, 0, 0);
  cam1.setPosition(0, 0, 0);
  currentCamera = 1;
  textFont(f, 50);
  textAlign(CENTER, CENTER);
}

function draw() {
  background(200);
  orbitControl();
  cam1.setPosition(0, 0, 520);
  drawBoxes();

  if (t2 - t1 > 0) {
    cam1.lookAt(t2, 0, 0)
    t2 -= 4*easing
    console.log(t2);
  }
  if (t2 - t1 < 0) {
    cam1.lookAt(t2, 0, 0)
    t2 += 4*easing
  }

  //key 'a'
  if (keyIsDown(65)) {
      t2 = -side;
    // setCamera(cam1);
    // currentCamera = 1;
    // cam1.lookAt(-side,0,0)
    // // cam1.setPosition(0,0,520)
  }

  //key 'd'
  if (keyIsDown(68)) {
    setCamera(cam1);
    currentCamera = 1;
    t2 = side;
    // cam1.lookAt(side, 0, 0);
    //side*2
    //-side
  }

}



function drawBoxes() {

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

  //Show Text in each face
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

function show3DlinesReference() {
  strokeWeight(5)

  //x
  stroke(153, 0, 0)
  line(0, 0, 100, 0)
  //y green
  stroke(34, 204, 0)
  line(0, 0, 0, -100)
  //z
  stroke(110, 150, 210)
  line(0, 0, 0, 0, 0, 100)
}
