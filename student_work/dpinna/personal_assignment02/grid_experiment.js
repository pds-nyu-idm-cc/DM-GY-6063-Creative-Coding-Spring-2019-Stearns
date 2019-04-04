let lines = [];

function setup() {
  createCanvas(1200, 600, WEBGL);
  // ortho(-300, 300, 600, -600, 0.1, 100);

  smooth();
  //width = 1200
  //height = 600

  stroke(255);
}

function draw() {

  specularMaterial(198);
  background(4, 50, 76)
  fill(140) //navy-ish blue
  strokeWeight(1)
  stroke(190);

  rotateX(PI / 4);
  for (var gridx = -width; gridx < width; gridx += 20) {
    for (var gridy = -height; gridy < height; gridy += 20) {
      grid = new Grid(gridx, gridy, 20);
      grid.display()
    }
  }
  // for (var gridx = 0; gridx < width; gridx += 20) {
  //   for (var gridy = 0; gridy < height; gridy += 20) {
  //     grid = new Grid(gridx, gridy, 20);
  //     grid.display()
  //   }
  // }


  // function mouseClicked(){
  //   camera(100, 100, 20 + sin(frameCount * 0.1) * 10, 0, 0, 0, 0, 1, 0);
  // }
  //
  // mouseClicked();

  // camera(x,y,z)

keyPressed()
  function keyPressed() {
    if (keyCode === RIGHT_ARROW) {
      mouseX == 0;
      mouseY ==0;
      // camera(100, mouseY, mouseX);
      console.log(mouseX, mouseY);
      // push();
      // translate(50, 0);
      // pop();
    }
  }

}
class Grid {

  constructor(x1, y1, size1) {
    this.x = x1;
    this.y = y1;
    this.size = size1;
  }

  display() {
    rect(this.x, this.y, this.size, this.size);
  }

  move() {
    camera(0, 0, 20 + sin(frameCount * 0.01) * 10, 0, 0, 0, 0, 1, 0);

  }
}
