void keyPressed() {
  switch( key ) {
  case 'n': //switch from noise background to default background
    showNoise = !showNoise;
    break;
  case 'r': //return to the original colors of the particles
    pcolor = color (98, 68, 136);
    p1color = color (63, 95, 212);
    break;
  
  case 's': //save the current image
    saveFrame("output/Sky-####.png");
    println("saved!");
    break;
  default:
    println("key not recognized...");
    break;
  }
}
