void freq () {
  colorMode(RGB,255);
  
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  
  fft.forward(audio.mix);
  
  colorMode(HSB,100);
  stroke(random(0, 100), random(15, 60), random(75,100));

  for (int i = 0; i < fft.specSize(); i++) {
    
    if(mousePressed){
      stroke(map(mouseX, 0, width, 0, 100), map(mouseY, 0, height, 25, 75), 100);
    }
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line(map(i, 0, fft.specSize(), 0, width), height/2 + fft.getBand(i)*8, map(i, 0, fft.specSize(), 0, width), height/2 - fft.getBand(i)*8 );

  }
}
