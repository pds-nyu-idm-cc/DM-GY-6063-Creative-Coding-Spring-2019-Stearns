var lines_y = [];

var a = 0;
var b = 0;
var c = 0;

function setup() {
  createCanvas(1200, 600, WEBGL);

  smooth();
  stroke(255);
  for (var i = -300; i <= 300; i += 1) {
    lines_y.push(i);
  }
}

function draw() {

  rotateX(PI / 4);
  background(51);
  strokeWeight(1);
  x1 = -width / 2 + 1
  x2 = width / 2

  // stroke("red");
  // if (a < lines_y.length) {
  //   line(x1, lines_y[a], x2, lines_y[a])
  //   a++
  // } else {
  //   a = 0;
  // }


  if (a < lines_y.length) {
    stroke("red");
    line(x1, lines_y[a], x2, lines_y[a])
    stroke("green");
    line(x1, lines_y[a + 20], x2, lines_y[a + 20])
    stroke("yellow");
    line(x1, lines_y[a + 40], x2, lines_y[a + 40])
    a++
  } else {
    a = 0;
  }



  // stroke("green");
  // if (b < lines_y.length) {
  //   line(x1, lines_y[b], x2, lines_y[b])
  //   b++
  // } else {
  //   b = 0;
  // }


  noStroke();
  fill(4, 50, 76) //navy-ish blue
  rect(-600, -300, 1200, 900)

  noStroke();
  fill("#1873C7")
  rect(-1500, -1000, 3000, 700)

}
