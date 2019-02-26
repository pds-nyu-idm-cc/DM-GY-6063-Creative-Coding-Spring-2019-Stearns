PImage img;
int xPos;
int yPos;
boolean is_loop = true;
int rotation = 1000;
float brush_size=50;
float currt_angle= 0.0;
float speed = 20;
float angle_growth= 0.5;
void setup() {
  size(500,633);
  img = loadImage("vangoff.png");
  image(img, 0, 0);
  background(100);
  xPos = width / 2;
  yPos = height / 2;
}
//loop
void draw() {
  if (is_loop ) {
    for (int i = rotation; i>0; --i) {
      brush_draw(brush_size);
    }
  }
}
//brush set
void brush_draw(float brush_size) {
  pushMatrix();
  translate(xPos, yPos);
  rotate(currt_angle);
  fill(img.get(xPos, yPos));
  stroke(img.get(xPos + 5, yPos + 5 ));
  rect(-brush_size/2, -brush_size/2, brush_size/2, brush_size/2);
  popMatrix();

  xPos += random(-speed, speed);
  yPos += random(-speed, speed);
  xPos = constrain(xPos, 5, width - 5);
  yPos = constrain(yPos, 5, height - 5);
  currt_angle += angle_growth;
}
//mouse press = stop
void mousePressed() {
  if (!is_loop) {  // cuz is_loop cannot be !loop
    xPos = mouseX; 
    yPos = mouseY; 
    loop();
  }
 else {hideBrush();} //just do this
}
//void getImgColor (float x, float y, float alpha)) {
 //if (img.pixels.length=false) { img.loadPixels(); }

//stop set
void hideBrush(){
for (float i=brush_size;i>0; i--) {
  brush_draw(i);
  draw();
}
 noLoop();
}
