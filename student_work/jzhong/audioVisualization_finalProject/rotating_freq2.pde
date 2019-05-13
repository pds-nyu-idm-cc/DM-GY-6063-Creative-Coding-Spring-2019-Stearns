void rotating_freq2() {
  colorMode(RGB, 255);
  

  if (detector.isRange(0,3,2)) {
    background(50,38,117);
  } else if (detector.isKick()) {
    background(159,79,68);
  } else if (detector.isSnare()) {
    background(180,134,170);
  } else if (detector.isHat()) {
    background(163,250,230);
  } else{
    background(0);
  }



  fft.forward(audio.mix);

  translate(width/2, height/2);

  //for (int o = 0; o<1; o++) {
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
  
}
