void rotating_freq2() {
  colorMode(RGB, 255);
  
  //changing background color while a beat is detected
  if (detector.isRange(0,3,2)) {
    fill(50,38,117,50);
  } else if (detector.isKick()) {
    fill(159,79,68,50);
  } else if (detector.isSnare()) {
    fill(180,134,170,50);
  } else if (detector.isHat()) {
    fill(163,250,230,50);
  } else{
    fill(0,50);
  }
  
  noStroke();
  rect(0,0,width,height);

  fft.forward(audio.mix);

  translate(width/2, height/2);

  for (int i=0; i<fft.specSize()/2; i++) {

    pushMatrix();
      rotate( frameCount*.01  + 2*PI/(fft.specSize())*i);
  
      stroke(101, 211, 110);
      float waveHeight = fft.getBand(i)*(map(dist, 0, 6, 50, 80));
      
      if (waveHeight > 300 ){
        waveHeight = 300 + (waveHeight-300)/4;
        
      }
      
      line(0, 0, waveHeight, 0); 

    popMatrix();
    
    pushMatrix();
      rotate( frameCount*.01 +2*PI/(fft.specSize())*i);
      line(0,0,-waveHeight, 0);
    popMatrix();
  }
  
  translate(-width/2, -height/2);
  
}
