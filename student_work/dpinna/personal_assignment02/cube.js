class Cube {
  // var position;
  // var velocity;
  // var rotation;
  // var w, h, d;
  // vertices[];

  // colors for faces of cube
  // color[] quadBG = new color[6];

  constructor(w, h, d) {
    this.w = w;
    this.h = h;
    this.d = d;

    // Colors are hardcoded
    quadBG[0] = color(0);
    quadBG[1] = color(51);
    quadBG[2] = color(102);
    quadBG[3] = color(153);
    quadBG[4] = color(204);
    quadBG[5] = color(255);

    velocity = random3D();
    // Random rotation
    rotation = (random(40, 100), random(40, 100), random(40, 100));

    // cube composed of 6 quads
    //front
    vertices[0] = (-w / 2, -h / 2, d / 2);
    vertices[1] = (w / 2, -h / 2, d / 2);
    vertices[2] = (w / 2, h / 2, d / 2);
    vertices[3] = (-w / 2, h / 2, d / 2);
    //left
    vertices[4] = (-w / 2, -h / 2, d / 2);
    vertices[5] =  (-w / 2, -h / 2, -d / 2);
    vertices[6] =  (-w / 2, h / 2, -d / 2);
    vertices[7] =  (-w / 2, h / 2, d / 2);
    //right
    vertices[8] =  (w / 2, -h / 2, d / 2);
    vertices[9] =  (w / 2, -h / 2, -d / 2);
    vertices[10] = (w / 2, h / 2, -d / 2);
    vertices[11] = (w / 2, h / 2, d / 2);
    //back
    vertices[12] = (-w / 2, -h / 2, -d / 2);
    vertices[13] =  (w / 2, -h / 2, -d / 2);
    vertices[14] =  (w / 2, h / 2, -d / 2);
    vertices[15] =  (-w / 2, h / 2, -d / 2);
    //top
    vertices[16] =  (-w / 2, -h / 2, d / 2);
    vertices[17] = (-w / 2, -h / 2, -d / 2);
    vertices[18] = (w / 2, -h / 2, -d / 2);
    vertices[19] = (w / 2, -h / 2, d / 2);
    //bottom
    vertices[20] = (-w / 2, h / 2, d / 2);
    vertices[21] = (-w / 2, h / 2, -d / 2);
    vertices[22] = (w / 2, h / 2, -d / 2);
    vertices[23] = (w / 2, h / 2, d / 2);
  }

  // Cube shape itself
  function drawCube(){
    // Draw cube
    for (var i = 0; i < 6; i++) {
      fill(quadBG[i]);
      beginShape(QUADS);
      for (var j = 0; j < 4; j++) {
        vertex(vertices[j + 4 * i].x, vertices[j + 4 * i].y, vertices[j + 4 * i].z);
      }
      endShape();
    }
  }

  // Update location
  function update() {
    position.add(velocity);

    // Check wall collisions
    if (position.x > bounds / 2 || position.x < -bounds / 2) {
      velocity.x *= -1;
    }
    if (position.y > bounds / 2 || position.y < -bounds / 2) {
      velocity.y *= -1;
    }
    if (position.z > bounds / 2 || position.z < -bounds / 2) {
      velocity.z *= -1;
    }
  }


  // Display method
  function display() {
    push();
    translate(position.x, position.y, position.z);
    rotateX(frameCount * PI / rotation.x);
    rotateY(frameCount * PI / rotation.y);
    rotateZ(frameCount * PI / rotation.z);
    noStroke();
    drawCube(); // Farm out shape to another method
    pop();
  }
}
