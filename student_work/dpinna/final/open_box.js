let side = 400;

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
  fill(0, 92, 161)
  vertex(-side, side, -side)
  vertex(side, side, -side)
  vertex(side, side, side)
  vertex(-side, side, side)
  endShape();
  //side-right
  fill(11, 64, 110)
  vertex(side, -side, -side)
  vertex(side, -side, side)
  vertex(side, side, side)
  vertex(side, side, -side)
  endShape();
  beginShape();
  //side-left
  fill(11, 64, 110)
  vertex(-side, -side, -side)
  vertex(-side, -side, side)
  vertex(-side, side, side)
  vertex(-side, side, -side)
  endShape();

  textSize(50);
  fill(250);
  translate(0, 0, -side + 1)
  text('The little Biplane that could', 0, 0);
  translate(0, 100, 0);
  textSize(50);
  text('Press Enter',0, 0);
  translate(0, 60, 0);
  text('to start the game', 0, 0);
  translate(0, -160, 0);

  fill(255, 250, 250);
  translate(-side + 1, 0, side);
  rotateY(radians(90));
  textSize(30);
  text('Change setting:', 0, 0);
  translate(0, 100, 0);
  textSize(20);
  text('Press 1', 0, 0);
  translate(0, 50, 0);
  text('to change plane', 0, 0);
  translate(0, -150, 0);
  rotateY(radians(-90));

  fill(255, 250, 250);
  translate((side * 2) - 2, 0, 0)
  rotateY(radians(-90));
  textSize(30);
  text('Change setting', 0, 0);
  translate(0, 100, 0);
  textSize(20);
  text('Press 2', 0, 0);
  translate(0, 50, 0);
  text('to disable obstacles', 0, 0);
  rotateY(radians(90));
  translate(0, -150, 0);

  fill(255, 250, 250);
  translate(-side, side - 1, -side/2)
  rotateX(radians(90))
  textSize(50);
  text('Change setting', 0, 0);
  translate(0, 100, 0);
  textSize(30);
  text('Press 3 to fly at night', 0, 0);

}
