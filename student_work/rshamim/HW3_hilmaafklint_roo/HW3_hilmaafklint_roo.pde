void setup (){
  size(500,500);
}

void draw () {
 background (197,86,58);
 stroke (0);
 
 //circle 1 white and blue
 
   fill (224,218,208);
  arc(width/2, height/2, 300, 300, -PI/2+ mouseX/10.0, PI/2+ mouseX/10.0, PIE);
   fill (96,143,192);
   arc(width/2, height/2, 300, 300,PI+ -PI/2+ mouseX/-10.0, PI+ PI/2+ mouseX/-10.0, PIE);

 //circle2 black and yellow
 
 fill (227,186,96);
  arc(width/2, height/2, 200, 200, PI+ -PI/2+ mouseX/-10.0, PI+ PI/2+ mouseX/-10.0, PIE);

 fill (42,42,42);
 arc(width/2, height/2, 200, 200, -PI/2+ mouseX/10.0, PI/2+ mouseX/10.0, PIE);

fill (231,153,130);
 arc(width/2, height/2, 100, 100, PI+ -PI/2+ mouseX/-10.0, PI+ PI/2+ mouseX/-10.0, PIE);
}
