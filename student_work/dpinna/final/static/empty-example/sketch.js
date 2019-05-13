function setup() {
  // put setup code here
  createCanvas(600, 500)
  r = 204;
  g = 204;
  b = 204;
  posX = 120;
  posY = 150;
}

function draw() {
  // put drawing code here
  background(220)

  fill(150);
  noStroke();
  rect(posX,posY,80,40);


  fill(100);
  rect(0,460, 150, 40);

  fill(250);
  text("Reset",30, 490);

  fill(r, g, b);
  textSize(24);
  text('Hello p5js',50,50);

  // console.log(mouseX, mouseY);

}

fuction resetPosition(){
  let reset_p = dist(mouseX,mouseY,x2,y2,[z2])
}

function mousePressed(){
  let p = dist(mouseX,mouseY,posX,posY);
  if (p < 50){
    r = random(0,250);
    g = random(0,250);
    b = random(0,250);
    posX = mouseX + random(-100,100);
    posY = mouseY + random(-100,100);
  }
}
