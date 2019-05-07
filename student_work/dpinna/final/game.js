var lines_y = [];

var a = 0;
var b = 0;
var c = 0;
var d = 0;
var e = 0;
var f = 0;
var obj_a;
var obj_b;
var obj_c;
var obj_d;
var obj_e;
var obj_f;
var defaultFrameRate = 25;
let plane = 'biplane';
var selected_plane;
var show_obstacles = true;
let img;
var game_level = 0;
let lighthouse;
let biplane;
var light = true;
let posEasing = 0.125;
let focEasing = 0.25;

var cam1CurrentPos = [0.0, 0.0, 0.0];
var cam1CurrentFoc = [0.0, 0.0, 0.0];

var cam1TargetPos = [0.0, 0.0, 520.0];
var cam1TargetFoc = [0.0, 0.0, -side / 2];

function preload() {

  //pre-loading obj files and textures

  biplane = {
    model: loadModel('objects/plane/plane.obj', true),
    material: loadImage('objects/plane/plane.png'),
    rot_X: 10,
    rot_Y: 268,
    rot_Z: 266,
    tr_X: 0,
    tr_Y: 80,
    tr_Z: 100
  }

  jet = {
    model: loadModel('objects/jet/Jet_01.obj', true),
    rot_X: 0,
    rot_Y: 0,
    rot_Z: 0,
    tr_X: 0,
    tr_Y: 0,
    tr_Z: 0
  }

  lighthouse = {
    model: loadModel('objects/lighthouse/Lighthouse.obj', true),
    material: loadImage('objects/lighthouse/Lighthouse\ texture.png'),

  }
  cruise = {
    model: loadModel('objects/cruise/CruiseLiner.obj', true),
    material: loadImage('objects/cruise/CruiseLiner_BaseColor.png')
  }

  volcano = {
    model: loadModel('objects/volcano/PUSHILIN_volcano.obj', true),
    material: loadImage('objects/volcano/PUSHILIN_volcano.png')

  }

  //Font, images and sound
  text_font = loadFont('static/Roboto.otf');
  sky = loadImage('static/sky.jpg');
  sky2 = loadImage('static/sky2.png');
  wagner = loadSound('static/wagner.mp3');
  engine = loadSound('static/biplane.mp3');

}


function setup() {
  createCanvas(1200, 600, WEBGL);
  background(51);
  frameRate(defaultFrameRate);
  smooth();
  stroke(255);

  wagner.setVolume(0.4);
  wagner.play();

  engine.setVolume(0.3)
  engine.play();
  engine.loop();

  // adding a few 'lines' that will specify the starting and ending
  // points where the objects will appear and disappear.
  for (var i = -300; i <= 500; i += 1) {
    lines_y.push(i);
  }

  cam1 = createCamera();
  currentCamera = 1;
  textFont(text_font, 50);
  textAlign(CENTER, CENTER);
}


function draw() {
  if (game_level == 0) {
    clear();
    //Showing the 3d UI with the settings to change
    background(200);
    drawBoxes();

    for (var i = 0; i < 3; i++) {
      cam1CurrentPos[i] += ease(cam1CurrentPos[i], cam1TargetPos[i], posEasing);
      cam1CurrentFoc[i] += ease(cam1CurrentFoc[i], cam1TargetFoc[i], focEasing);
    }

    cam1.setPosition(cam1CurrentPos[0], cam1CurrentPos[1], cam1CurrentPos[2]);
    cam1.lookAt(cam1CurrentFoc[0], cam1CurrentFoc[1], cam1CurrentFoc[2]);

    // key '1'
    if (keyIsDown(49)) {
      plane = 'jet';
      var selected_plane = plane
    }

    // key '2'
    if (keyIsDown(50)) {
      show_obstacles = false;
    }

    // key '3'
    if (keyIsDown(51)) {
      light = false;
    }

    // key 'enter'
    if (keyIsDown(13)) {
      cam1TargetPos = [0.0, 0.0, 520.0];
      cam1TargetFoc = [0.0, 0.0, -side / 2];
      game_level = 1;

    }

    // key 'enter'
    if (keyIsDown(27)) {
      game_level = 0;

    }

  }

  if (game_level == 1) {
    clear();
    move_model();
    rotateX(PI / 3);

    // showtime
    show_score();
    if (light == true) {
      ambientLight(250);
    } else {
      ambientLight(2);
    }

    show_background();

    if (show_obstacles == true) {
      show_objects();
    } else {}

    show_biplane();
  }

}

function keyTyped() {
  switch (key) {
    case 'd':
      cam1TargetPos = [-300.0, 0.0, 0.0];
      cam1TargetFoc = [-side / 2, 0.0, 0.0];
      break;
    case 's':
      cam1TargetPos = [0.0, 0.0, 520.0];
      cam1TargetFoc = [0.0, 0.0, -side / 2];
      break;
    case 'a':
      cam1TargetPos = [300.0, 0.0, 0.0];
      cam1TargetFoc = [side / 2, 0.0, 0.0];
      break;
    case 'x':
      cam1TargetPos = [0.0, -520.0, 0.0];
      cam1TargetFoc = [0.0, 0.0, -side / 2];
      break;
  }
}

// simple
function ease(_current, _target, _factor) {
  return (_target - _current) * _factor;
}

function kick_off() {
  if (keyIsDown(ENTER)) {
    game_level = 1;
  }
}

function show_objects() {
  if (frameCount > 25 && a <= lines_y.length) {
    // remove push and pop the whole camera scene moves.
    obj_a = show_object(lighthouse, -450, lines_y[a]);
    a += 5
  } else {
    a = 0
  }

  // console.log(int(dist()));
  if (frameCount > 50 && b <= lines_y.length) {
    obj_b = show_object(cruise, 200, lines_y[b])
    b += 5
  } else {
    b = 0
  }

  if (frameCount > 75 && c <= lines_y.length) {
    obj_c = show_object(volcano, 20, lines_y[c])
    c += 5
  } else {
    c = 0
  }
  if (frameCount > 100 && d <= lines_y.length) {
    // line(x1, lines_y[d], x2, lines_y[d])
    obj_d = show_object(lighthouse, -100, lines_y[d])
    d += 5
  } else {
    d = 0
  }

  if (frameCount > 175 && e <= lines_y.length) {
    obj_e = show_object(cruise, -100, lines_y[e])
    e += 5
  } else {
    e = 0
  }
}

function show_biplane() {
  //setting initial biplane position front-facing and leveled.
  if (plane == 'biplane') {
    push();
    rotateX(radians(biplane.rot_X));
    rotateY(radians(biplane.rot_Y));
    rotateZ(radians(biplane.rot_Z));
    translate(biplane.tr_X, biplane.tr_Y, biplane.tr_Z)
    texture(biplane.material);
    model(biplane.model);
    pop();
  } else {
    model(jet.model);
    push();
    rotateX(radians(jet.rot_X));
    rotateY(radians(jet.rot_Y));
    rotateZ(radians(jet.rot_Z));
    translate(jet.tr_X, jet.tr_Y, jet.tr_Z)
    model(jet.model);
    pop();
  }
}

function reset_biplane() {
  biplane.rot_X = 10
  biplane.rot_Y = 268
  biplane.rot_Z = 266
  biplane.tr_X = 0
  biplane.tr_Y = 80
  biplane.tr_Z = 100
}

function show_background() {
  noStroke();
  //ground-plane
  fill(4, 50, 76) //navy-ish blue
  rect(-2400, -800, 4800, 1900)
  noStroke();
  //placing the sky as a sphere
  texture(sky2);
  push()
  rotateX(11.4);
  rotateY(617);
  rotateZ(12.4);
  sphere(1200, 100);
  pop();

}

function move_model() {
  if (keyIsDown(SHIFT)) {
    reset_biplane();

  }
  if (keyIsDown(RIGHT_ARROW)) {
    biplane.tr_Z -= 5;
    jet.tr_Z -= 5;
    biplane.rot_Y += 0.2;
    jet.rot_Y += 0.2;
  }

  if (keyIsDown(LEFT_ARROW)) {
    biplane.tr_Z += 5;
    jet.tr_Z += 5;
    biplane.rot_Y -= 0.2;
    jet.rot_Y -= 0.2;

  }

  if (keyIsDown(UP_ARROW)) {
    biplane.tr_X += 5;
    jet.rot_X += 5;
  }

  if (keyIsDown(DOWN_ARROW)) {
    biplane.tr_X -= 5;
    jet.tr_X -= 5;
  }

  if (keyIsDown(65)) { //button a
    biplane.rot_X += 2;
    jet.rot_X += 2
  }

  if (keyIsDown(68)) { //button d
    biplane.rot_X -= 2;
    jet.rot_X -= 2;
  }

  if (keyIsDown(90)) { //button z
    biplane.rot_Z += 2;
    jet.rot_Z += 2;

  }

  if (keyIsDown(67)) { //button c
    biplane.rot_Z -= 2;
    jet.rot_Z -= 2;

  }

  if (keyIsDown(69)) { //button q
    biplane.tr_Y += 3;
    jet.tr_Y += 3;

  }
  if (keyIsDown(81)) { //button e
    biplane.tr_Y -= 3;
    jet.tr_Y -= 3;
  }

}


function show_object(object, pos_x, pos_y) {
  push()
  translate(pos_x, pos_y, 65);
  rotateX(radians(90))
  texture(object.material);
  model(object.model);
  pop();
  return {
    x: pos_x,
    y: pos_y
  };
}


function show_score() {
  let miles = frameCount;
  textSize(26);
  textFont(text_font);
  textAlign(LEFT);

  push()
  rotateX(4.974188368183839);
  translate(90, -10, 355)
  fill(40)
  text(miles + "miles", 10, 10);
  translate(0, 0, -1)
  fill(255)
  rect(0, 0, 120, 25);
  pop()
}
