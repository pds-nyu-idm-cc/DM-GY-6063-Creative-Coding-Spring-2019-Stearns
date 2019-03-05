// x, y coordinates of a circle
var circle_x = 50;
var circle_y = 50;
var circle_d = 50; // diameter
var circle_f;
var circle_s;

function setup() {
  createCanvas(400, 400);
  circle_f = color(127, 192, 255);
  circle_s = color(63, 127, 255);
}

function draw() {
  background(220);
  stroke(circle_s);
  fill(circle_g);
  circle(circle_x, circle_y, circle_d);
}