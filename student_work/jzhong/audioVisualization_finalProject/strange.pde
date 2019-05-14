void strange () {
  colorMode(RGB, 255);
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  strokeWeight(2);
  stroke(255, 211, 79);
  fft.forward(audio.mix);

  translate(width/2, height/2);

  
  for (int i=0; i<fft.specSize(); i++) {

    pushMatrix();
    rotate( (frameCount*.05  + 2*PI/(fft.specSize())*i)* -1);

    translate(100+map(dist, 0, 6, 0, 50), 0);

    float waveHeight = fft.getBand(i)*50;

    //making the lines more managable 
    if (waveHeight > 20 ) {
      waveHeight = waveHeight/3;
      if (waveHeight >300 ) {
        waveHeight = 300;
      }
    }

    line(0, 0, 0, waveHeight); 

    fill(255, 0, 0);
    popMatrix();

    pushMatrix();
    rotate( (frameCount*.05  + 2*PI/(fft.specSize())*i)* -1);
    translate(-1*(100+map(dist, 0, 6, 0, 50)), 0);
    line(0, 0, 0, -waveHeight); 
    popMatrix();
  }
  translate(-width/2, -height/2);
}
