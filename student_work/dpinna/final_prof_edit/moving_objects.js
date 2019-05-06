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
let plane;
let img;
var game_level = 0;
let lighthouse;
let biplane;

function preload() {

  //pre-loading obj files and textures
  //they don't look great, but they provide a better understanding
  //of what kind of objects are they

  biplane = {
    model: loadModel('plane/plane.obj', true),
    material: loadImage('plane/plane.png'),
    hit: loadImage('plane/hit.png'),
    rot_X: 10,
    rot_Y: 268,
    rot_Z: 266,
    tr_X: 0,
    tr_Y: 80,
    tr_Z: 100
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

  //adding a few lines that will specify the starting and ending
  // points where the objects will appear and disappear.
  for (var i = -300; i <= 500; i += 1) {
    lines_y.push(i);
  }
}


function draw() {
  if (game_level == 0) {
    clear();
    background(4, 50, 76);
    textSize(32);
    textAlign(CENTER);
    textFont(text_font);
    fill('white');
    text("The little Biplane that could", 0, 0);
    textSize(24);
    text("Play", 0, 80);
    kick_off();
  }

  if (game_level == 1) {
    clear();
    move_model();
    rotateX(PI / 3);
    orbitControl();

    // showtime
    // show_score(); //text is treated as a 3d item and words are rotated
    ambientLight(200, 200, 200);
    show_background();
    show_objects();
    show_biplane();
    calculate_collision();

  }

}

function kick_off() {
  if (mouseIsPressed) {
    if (mouseButton == LEFT) {
      game_level = 1;
    }
  }

  if (keyIsDown(ENTER)) {
    game_level = 1;
  }
}

function show_objects(){
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
  push();
  rotateX(radians(biplane.rot_X));
  rotateY(radians(biplane.rot_Y));
  rotateZ(radians(biplane.rot_Z));
  translate(biplane.tr_X, biplane.tr_Y, biplane.tr_Z)
  texture(biplane.material);
  model(biplane.model);
  pop();
  // console.log(position());
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
  rect(-1200, -400, 2400, 1100)
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
    biplane.rot_Y += 0.2;
  }

  if (keyIsDown(LEFT_ARROW)) {
    biplane.tr_Z += 5;
    biplane.rot_Y -= 0.2;

  }

  if (keyIsDown(UP_ARROW)) {
      biplane.tr_X += 5;

  } else {
    // biplane.tr_X += -2;
  }


  if (keyIsDown(DOWN_ARROW)) {
      biplane.tr_X -= 5;
  }

  if (keyIsDown(65)) { //button a

    if (biplane.rot_X < 24) {
      biplane.rot_X += 2;
    }

  }

  if (keyIsDown(68)) { //button d

    if (biplane.rot_X <= 24 && biplane.rot_X > 0) {
      biplane.rot_X -= 2;
    }

  }

  if (keyIsDown(90)) { //button z
    if (biplane.rot_Z < 300 && biplane.rot_Z >= 250) {
      biplane.rot_Z += 2;
    }

  }

  if (keyIsDown(67)) { //button c
    if (biplane.rot_Z <= 300 && biplane.rot_Z > 250) {
      biplane.rot_Z -= 2;
    }

  }

  if (keyIsDown(69)) { //button q
    // if (biplane.rot_Y < 300 && biplane.rot_Y >= 250) {
      biplane.tr_Y += 3;
    // }

  }
  if (keyIsDown(81)) { //button e
    // if (biplane.tr_Y <= 300 && biplane.rot_Y > 250) {
      biplane.tr_Y -= 3;
    // }

  }

  if (keyIsDown(49)) { //button e
      texture(biplane.hit);

      console.log("hit");

  } else {
    // biplane.material == fill(255)
  }


}

function calculate_collision(){

  // console.log("distance: "+dist(0,0,0,biplane.tr_X,biplane.tr_Y,biplane.tr_Z))
  // console.log("x "+dist(biplane.tr_X,biplane.tr_Y,)/
  // dist(x1,y1,[z1],x2,y2,[z2])
  // console.log("y "+biplane.tr_Y)
  // console.log("z "+biplane.tr_Z)
  // console.log("y: "+obj_a.y);
  // console.log(dist(obj_a.x,obj_a.y,biplane.tr_X,biplane.tr_Y));

}

function show_object(object, pos_x, pos_y) {
  push()
  translate(pos_x, pos_y, 65);
  rotateX(radians(90))
  texture(object.material);
  model(object.model);
  pop();
  return {x: pos_x, y: pos_y};
}


function show_score() {
  fill(40)
  push()
  rotateX(90);
  // translate(100, -110, -315)
  score = rect(0, 0, 150, 50);
  score.position(0,0);
  textSize(26);
  textFont(text_font);
  textAlign(LEFT);
  text(frameCount/10, 0, 0);
  text("Miles flown", 40, 0);
  pop()
}
