void particles () {
  //draw a rectangle as background, which has an alpha of 10
  //so the circles make tails when they move
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  
  for (Circle c: circles) {
    
    c.update();
    
    c.render();
  
}
  
}
