int a = 4;
int b = 3;
color fillColor=color(0);

void setup(){
  size(500,500);
 
}
void draw() {

  a++;
  a%=25;
  b++;
  b%=13;
  fill(fillColor);
  if (a == b) {
    //println("a is equal to b");
    ellipse(random(width), random(height), 25, 25);
  } else if (a < b) {
    //println("a is less than b");
    rect(random(width), random(height), 25, 25);
  } else {
    //println("a must be greater than b");
    fillColor=color(random(256),random(256),random(256));
  }
}
