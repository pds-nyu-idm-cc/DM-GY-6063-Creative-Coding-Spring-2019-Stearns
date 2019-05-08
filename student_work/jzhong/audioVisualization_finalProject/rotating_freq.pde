void rotating_freq () {
  colorMode(RGB, 255);
  background(0);
  
  fft.forward(audio.mix);
  
  translate(width/2, height/2);

  
    for (int i=0; i<fft.specSize(); i++) {
      
      pushMatrix();
      rotate( frameCount*.01 + 2*PI/(fft.specSize())*i);

      // ellipse(0,0,r,r);
      // fill(255,0,0);
      // rect(0,0,s,s);

      translate(120+map(dist, 0, 6, 50, 200), 0);
      stroke(151,280,150);
      float waveHeight = fft.getBand(i)*24;
        
        //making the lines more managable 
        if (waveHeight > 20 ){
          waveHeight = waveHeight/5;
          if (waveHeight >100 ){
            waveHeight = waveHeight/10;
          }
        }
        
      line(-waveHeight, 0, waveHeight, 0); 
      
      fill(255, 0, 0);
      //ellipse(0, 0, r, r);
      //rect(-s, -s, 2*s, 2*s);
      popMatrix();
    }
  translate(-width/2, -height/2);
}
