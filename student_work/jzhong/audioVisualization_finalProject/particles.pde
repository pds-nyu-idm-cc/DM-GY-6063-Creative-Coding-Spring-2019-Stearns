void particles () {
  //draw a rectangle as background, which has an alpha of 10
  //so the circles make tail when they move
  fill(0,5);
  rect(0,0,width,height);
  
  
  for (Circle c: circles) {
    
    c.update();
    
    c.render();
  
}
  
}
