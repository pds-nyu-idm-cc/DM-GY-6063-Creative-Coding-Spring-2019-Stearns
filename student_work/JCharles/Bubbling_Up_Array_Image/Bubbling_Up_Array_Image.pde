PImage flower;

Bubble[] bubbles = new Bubble[2];

void setup(){
  size(640,360);
  flower = loadImage("flower.jpg");
  bubbles[0] = new Bubble(64);
  bubbles[1] = new Bubble(16);
}

void draw(){
  background(255);
  imageMode(CENTER);
  //image(flower, 320,180);
  bubbles[0].ascend();
  bubbles[0].display();
  bubbles[0].top();
  
  bubbles[1].ascend();
  bubbles[1].display();
  bubbles[1].top();
}
