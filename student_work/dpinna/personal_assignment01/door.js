var x;

function setup() {
  createCanvas(1200, 600);
  //framing the canvas
  stroke("grey");
  strokeWeight(1);
  noFill();
  rect(0, 0, 1199, 599);
  mouseX = 0;
  mouseY = 0;
}

function draw() {

  //inside
  fill('#D8D8D8');
  rect(0, 0, 100, 200);

  // quad(0,0,90,10,90,190,0,200);
  if (mouseX > 10 && mouseX < 100) {
    fill('#696969');
    quad(0, 0, mouseX, 10, mouseX, 190, 0, 200);
  } else if (mouseX > 100) {
    fill('#696969');
    quad(0, 0, 100, 0, 100, 200, 0, 200);
  } else {
    quad(0, 0, 100, 0, 100, 200, 0, 200);
  }

  fill('#D8D8D8');
  rect(100, 0, 100, 200);
  // rect(x,y,width,height)
  // quad(x1,y1,x2,y2,x3,y3,x4,y4)
  fill('#696969');


  if (mouseX > 100 && mouseX < 200) {
    fill('#696969');
    // quad(110, 10, 200, 0, 200, 200, 110, 190);
    quad(mouseX, 10, 200, 0, 200, 200, mouseX, 190);
  } else if (mouseX > 200) {
    fill('#696969');
    quad(100, 0, 200, 0, 200, 200, 100, 200);
  } else {
    quad(100, 0, 200, 0, 200, 200, 100, 200);
  }

}

function mouseDragged() {

  var a = a - 1;
  fill('#696969');
  if (mouseX) {

  }
  rect(mouseX, mouseY, 100, 200, 5, 5);
  // redraw();


}
