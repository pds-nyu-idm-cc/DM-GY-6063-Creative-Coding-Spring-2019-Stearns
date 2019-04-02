class Node {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius;
  color c;
  float easing = 0.01;
  
  Node( )
  {
    position = new PVector();
    velocity = new PVector(0.01,0.01);
    position.x = random(0, width);
    position.y = random(0, height);
    radius = random(1, 5);
    int j = (int)random(0, 4);
    if (j==0)
    {
      c = color(#e87285);
    }
    if (j==1)
    {
      c = color(#DDEEFE);
    }
    if (j==2)
    {
      c = color(#D9F6F1);
    }
    if (j==3)
    {
      c = color(#F9F7C7);
    }
  }

  void display()
  {
    pushStyle();
    noStroke();
    fill(c);
    ellipse(position.x, position.y, radius, radius);
    popStyle();
  }

  void update()
  {
    position.add(velocity);
    if(position.x > width-radius || position.x < 0+radius){
      velocity.x=velocity.x * - 1;
    }
    if(position.y > height-radius || position.y < 0+radius){
      velocity.y=velocity.y * - 1;
    }
  }
  
  void mouseMove(){
    float targetX = mouseX;
    float dx = targetX - position.x;
    position.x += dx * easing;
    
    float targetY = mouseY;
    float dy = targetY - position.y;
    position.y += dy * easing;
  }
}
