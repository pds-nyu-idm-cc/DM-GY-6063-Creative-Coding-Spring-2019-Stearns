
var circlex;
var circley;
var circler;

function setup() {
  createCanvas(600, 600);
  
  background(255);
  
  circlex = width/2;
  circley = height/2;
  circler = 100;
}

function draw() {
  background(255);
  
   noStroke();
  
  if(dist(mouseX,mouseY, circlex,circley)< circler){
    fill(255,0,0);
  }else{
    fill(0,75,90);  
  }

  ellipse(circlex,circley, circler*2,circler*2);
  
  if(mouseIsPressed){
    fill(180,100,180);
  }
  
  ellipse(circlex,circley, circler*2,circler*2);
  
}