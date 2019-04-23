/**
 moving picture of painting Nihonbashi
*/

int noi = 14;

PImage[] images = new PImage[noi];

void setup () {
  
  for (int i = 0; i<images.length; i++) {

    String file = "images/Nihonbashi-" + nf(i, 3)+ ".png";
    images[i] = loadImage(file);
    
  }
  
}
