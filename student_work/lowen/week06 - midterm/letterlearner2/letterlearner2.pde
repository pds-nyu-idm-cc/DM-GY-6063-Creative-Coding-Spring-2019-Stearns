//Letters
//Lauren Owen

//Audio llibrary
import ddf.minim.*;
Minim minim;
AudioPlayer sound;

float sizeRect;
float sizeEllip;

void setup() {
size (720,720);
background(255);
noStroke();

//Welcome page with instructions
intro();

//Audio
minim = new Minim(this);
}

void draw () {
}

//Entering corressponding letter button draws letter + and generates letter name
//Still looking for letter sounds mp3 but the current data files fill suffice
//Letters start with patterns because they help child development
//but when pressing the same key again the texture can be regenerated at random
void keyPressed(){
  
//Backspace brings returns user to intro screen
 switch (key) {
 case BACKSPACE:
 intro();  
 break;


//Letter drawn with letter-shaped masks and patters
 case 'q':
 //Colors for pattern
 pattern(#525c7a, #8c95b2, #312848);
 //Color of letter-shaped mask
 fill (#f0f9ff);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,515);
  vertex (268,594);
  vertex (311,594);
  vertex (311,678);
  vertex (409,678);
  vertex (409,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
   vertex (309,212);
   vertex (412,212);
   vertex (429,229);
   vertex (429,479);
   vertex (412,496);
   vertex (309,496);
   vertex (291,479);
   vertex (291,229);
 endShape();
 //Calls sound to play from data folder
 sound = minim.loadFile("q (1).mp3");
 sound.play();
 break;
   
 case 'w':
 pattern(#fdfad6, #f66249, #e39d29);
 fill (#4b2b00);
 beginShape();
  vertex (0,0);
  vertex (76,0);
  vertex (76,114);
  vertex (173,114);
  vertex (173,478);
  vertex (190,496);
  vertex (293,496);
  vertex (311,478);
  vertex (311,114);
  vertex (408,114);
  vertex (408,478);
  vertex (426,496);
  vertex (529,496);
  vertex (547,478);
  vertex (547,114);
  vertex (644,114);
  vertex (644,515);
  vertex (569,594);
  vertex (386,594);
  vertex (360,567);
  vertex (334,594);
  vertex (150,594);
  vertex (76,515);
  vertex (76,114);
  vertex (76,0);
  vertex (0,0);
  vertex (0,720);
  vertex (720,720);
  vertex (720,0);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("w (1).mp3");
 sound.play();
 break;
   
 case 'e':
 pattern(#aaecbf, #239f96, #9be356);
 fill (#cf204f);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,515);
  vertex (268,594);
  vertex (311,594);
  vertex (409,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,447);  
  vertex (429,447);
  vertex (429,478);
  vertex (411,496);
  vertex (308,496);
  vertex (291,478);
  vertex (291,427);
  vertex (411,427);
  vertex (411,329);
  vertex (291,329);
  vertex (291,229);
  vertex (308,212);
  vertex (411,212);
  vertex (429,229);
  vertex (429,261);
  vertex (526,261);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("e (1).mp3");
 sound.play();
 break;
   
 case 'r':
 pattern(#fbcf94, #c0c1be, #ebe7ba);
 fill (#1b7676);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,594);
  vertex (291,594);
  vertex (291,427);
  vertex (344,427);
  vertex (417,594);
  vertex (526,594);
  vertex (452,427);
  vertex (527,348);
  vertex (527,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
 vertex (309,212);
 vertex (291,229);
 vertex (291,311);
 vertex (309,329);
 vertex (412,329);
 vertex (429,311);
 vertex (429,229);
 vertex (412,212);
 vertex (309,212);
 endShape();
 sound = minim.loadFile("r (1).mp3");
 sound.play();
 break;
   
 case 't':
 pattern(#d87424, #cf8c22, #fdc934);
 fill (#8c95b2);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (194,114);
  vertex (194,212);
  vertex (311,212);
  vertex (311,594);
  vertex (409,594);
  vertex (409,212);
  vertex (526,212);
  vertex (526,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("t (1).mp3");
 sound.play();
 break;
   
 case 'y':
 pattern(#5bae86, #4e9472, #ecd5ab);
 fill (#da332d);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,378);
  vertex (291,329);
  vertex (291,114);
  vertex (194,114);
  vertex (194,381);
  vertex (311,463);
  vertex (311,594);
  vertex (409,594);
  vertex (409,463);
  vertex (526,381);
  vertex (526,114);
  vertex (429,114);
  vertex (429,329);
  vertex (360,378);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("y (1).mp3");
 sound.play();
 break;
   
 case 'u':
 pattern(#fbcf94, #f5ad3f, #79baae);
 fill (#d87424);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,496);
  vertex (309,496);
  vertex (291,479);
  vertex (291,114);
  vertex (194,114);
  vertex (194,515);
  vertex (268,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,114);
  vertex (429,114);
  vertex (429,479);
  vertex (412,496);
  vertex (360,496);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("u (1).mp3");
 sound.play();
 break;
   
 case 'i':
 pattern(#b81200, #fdd329, #d92600);
 fill (#184844);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (311,114);
  vertex (311,594);
  vertex (409,594);
  vertex (409,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("i (1).mp3");
 sound.play();
 break;
   
 case 'o':
 pattern(#5fc9e3, #2b80c5, #1667a8);
 fill (#314454);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,515);
  vertex (268,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
   vertex (309,212);
   vertex (412,212);
   vertex (429,229);
   vertex (429,479);
   vertex (412,496);
   vertex (309,496);
   vertex (291,479);
   vertex (291,229);
 endShape();
 sound = minim.loadFile("o (1).mp3");
 sound.play();
 break;
  
 case 'p':
 pattern(#ccb794, #eedcc5, #fdd86a);
 fill (#87a00a);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,594);
  vertex (291,594);
  vertex (291,427);
  vertex (452,427);
  vertex (527,348);
  vertex (527,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
  vertex (309,212);
  vertex (291,229);
  vertex (291,311);
  vertex (309,329);
  vertex (412,329);
  vertex (429,311);
  vertex (429,229);
  vertex (412,212);
  vertex (309,212);
 endShape();
 sound = minim.loadFile("p (1).mp3");
 sound.play();
 break;
   
 case 'a':
 pattern(#87a00a, #a9ba51, #c8d38b);
 fill (#5f4f44);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,594);
  vertex (291,594);
  vertex (291,427);
  vertex (429,427);
  vertex (429,594);
  vertex (527,594);
  vertex (527,348);
  vertex (527,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
  vertex (309,212);
  vertex (291,229);
  vertex (291,329);
  vertex (429,329);
  vertex (429,229);
  vertex (412,212);
  vertex (309,212);
 endShape();
 sound = minim.loadFile("a (1).mp3");
 sound.play();
 break;
   
 case 's':
 pattern(#b1c58f, #d3d097, #e2e0c8);
 fill (#679381);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,274);
  vertex (429,478);
  vertex (412,496);
  vertex (309,496);
  vertex (291,478);
  vertex (291,447);
  vertex (194,447);
  vertex (194,515);
  vertex (268,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,435);
  vertex (291,230);
  vertex (308,212);
  vertex (411,212);
  vertex (429,229);
  vertex (429,261);
  vertex (526,261);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("s (1).mp3");
 sound.play();
 break;
   
 case 'd':
 pattern(#b7b0aa, #948886, #c0b99e);
 fill (#fff5da);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (239,114);
  vertex (194,163);
  vertex (194,212); 
  vertex (239,212); 
  vertex (239,496); 
  vertex (194,496);  
  vertex (194,546);
  vertex (239,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
   vertex (336,212);
   vertex (412,212);
   vertex (429,229);
   vertex (429,479);
   vertex (412,496);
   vertex (336,496);
   vertex (336,212);
 endShape();
 sound = minim.loadFile("d (1).mp3");
 sound.play();
 break;
   
 case 'f':
 pattern(#42614d, #1d7b79, #679381);
 fill (#aaecbf);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,594);
  vertex (291,594);
  vertex (291,427);
  vertex (411,427);
  vertex (411,329);
  vertex (291,329);
  vertex (291,229);
  vertex (308,212);
  vertex (411,212);
  vertex (429,229);
  vertex (429,261);
  vertex (526,261);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("f (1).mp3");
 sound.play();
 break;
   
 case 'g':
 pattern(#626365, #c0c1be, #ffffff);
 fill (#c63134);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,515);
  vertex (268,594);
  vertex (311,594);
  vertex (409,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,329);  
  vertex (360,329);
  vertex (360,427);
  vertex (429,427);  
  vertex (429,478);
  vertex (411,496);
  vertex (308,496);
  vertex (291,478);
  vertex (291,229);
  vertex (308,212);
  vertex (411,212);
  vertex (429,229);
  vertex (429,261);
  vertex (526,261);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("g (1).mp3");
 sound.play();
 break;
   
 case 'h':
 pattern(#ebe7ba, #d89619, #c4361b);
 fill (#1b7676);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,329);
  vertex (291,329);
  vertex (291,114);
  vertex (196,114);
  vertex (196,596);
  vertex (291,596);
  vertex (291,427);
  vertex (429,427);
  vertex (429,596);
  vertex (526,596);
  vertex (526,114);
  vertex (429,114);
  vertex (429,329);
  vertex (360,329);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("h (1).mp3");
 sound.play();
 break;
   
 case 'j':
 pattern(#fcc33b, #49c79c, #94cd4f);
 fill (#e13b52);
 beginShape();
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,496);
  vertex (309,496);
  vertex (291,479);
  vertex (291,447);
  vertex (194,447);
  vertex (194,515);
  vertex (268,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,114);
  vertex (429,114);
  vertex (429,479);
  vertex (412,496);
  vertex (360,496);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("j (1).mp3");
 sound.play();
 break;
   
 case 'k':
 pattern(#ebe7ba, #eedcc5, #e0004a);
 fill (#7bffc3);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,329);
  vertex (291,329);
  vertex (291,114);
  vertex (196,114);
  vertex (196,596);
  vertex (291,596);
  vertex (291,427);
  vertex (411,427);
  vertex (429,444);
  vertex (429,596);
  vertex (526,596);
  vertex (526,408);
  vertex (498,378);
  vertex (526,348);
  vertex (526,114);
  vertex (429,114);
  vertex (429,311);
  vertex (411,329);
  vertex (360,329);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("k (1).mp3");
 sound.play();
 break;
   
 case 'l':
 pattern(#95ad90, #4a8380, #d8d99d);
 fill (#2a2536);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,496);
  vertex (309,496);
  vertex (291,479);
  vertex (291,114);
  vertex (194,114);
  vertex (194,515);
  vertex (268,594);
  vertex (526,594);
  vertex (526,496);
  vertex (360,496);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("l (1).mp3");
 sound.play();
 break;
   
 case 'z':
 pattern(#9d9d9d, #555c65, #4e6c8b);
 fill (#d9dbe0);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (194,114);
  vertex (194,212);
  vertex (412,212);
  vertex (429,230);
  vertex (194,435);
  vertex (194,515);
  vertex (268,594);
  vertex (526,594);
  vertex (526,496);
  vertex (308,496);
  vertex (291,478);
  vertex (526,274);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 //I have no idea why the Z file sounds like "Zedd"
 sound = minim.loadFile("z (1).mp3");
 sound.play();
 break;
   
 case 'x':
 pattern(#de4834, #f2dfb1, #f4be34);
 fill (#232731);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,329);
  vertex (291,329);
  vertex (291,114);
  vertex (196,114);
  vertex (196,348);
  vertex (223,378);  
  vertex (196,408);
  vertex (196,596);
  vertex (291,596);
  vertex (291,427);
  vertex (411,427);
  vertex (429,444);
  vertex (429,596);
  vertex (526,596);
  vertex (526,408);
  vertex (498,378);
  vertex (526,348);
  vertex (526,114);
  vertex (429,114);
  vertex (429,311);
  vertex (411,329);
  vertex (360,329);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("x (1).mp3");
 sound.play();
 break;
   
 case 'c':
 pattern(#54bbc7, #79baae, #b9f0e8);
 fill (#f75900);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,515);
  vertex (268,594);
  vertex (311,594);
  vertex (409,594);
  vertex (452,594);
  vertex (526,515);
  vertex (526,447);  
  vertex (429,447);  
  vertex (429,478);
  vertex (411,496);
  vertex (308,496);
  vertex (291,478);
  vertex (291,229);
  vertex (308,212);
  vertex (411,212);
  vertex (429,229);
  vertex (429,261);
  vertex (526,261);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("c (1).mp3");
 sound.play();
 break;
   
 case 'v':
 pattern(#af806c, #7d5c4e, #e6e3b1);
 fill (#92b989);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,475);
  vertex (291,427);
  vertex (291,114);
  vertex (194,114);
  vertex (194,478);
  vertex (360,594);
  vertex (526,478);
  vertex (526,114);
  vertex (429,114);
  vertex (429,427);
  vertex (360,475);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("v (1).mp3");
 sound.play();
 break;
   
 case 'b':
 pattern(#ca0000, #e82700, #ea5215);
 fill (#450000);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (239,114);
  vertex (194,163);
  vertex (194,212); 
  vertex (239,212); 
  vertex (239,496); 
  vertex (194,496);  
  vertex (194,546);
  vertex (239,594);
  vertex (452,594);
  vertex (526,515);   
  vertex (526,408);
  vertex (498,378);
  vertex (526,348);
  vertex (526,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 beginShape();
   vertex (336,212);
   vertex (412,212);
   vertex (429,229);
   vertex (429,288);
   vertex (412,307);
   vertex (336,307);
   vertex (336,212);
 endShape();
 beginShape();
   vertex (336,405);
   vertex (412,405);
   vertex (429,422);
   vertex (429,479);
   vertex (412,496);
   vertex (336,496);
   vertex (336,405);
 endShape();
 sound = minim.loadFile("b (1).mp3");
 sound.play();
 break;
   
 case 'n':
 pattern(#65e658, #7bffc3, #83b72f);
 fill (#5482ff);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,114);
  vertex (268,114);
  vertex (194,193);
  vertex (194,594);
  vertex (291,594);
  vertex (291,229);
  vertex (309,212);  
  vertex (412,212);  
  vertex (429,229);
  vertex (429,594);
  vertex (527,594);
  vertex (527,348);
  vertex (527,193);
  vertex (452,114);
  vertex (360,114);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("n (1).mp3");
 sound.play();
 break;
   
 case 'm':
 pattern (#ca0000, #e78719, #5c0004);
 fill (#efefec);
 beginShape();
  vertex (0,0);
  vertex (360,0);
  vertex (360,141);
  vertex (334,114);
  vertex (151,114);
  vertex (76,193);
  vertex (76,594);
  vertex (173,594);
  vertex (173,229);
  vertex (190,212);
  vertex (294,212);
  vertex (311,229);
  vertex (311,594);
  vertex (409,594);
  vertex (409,229);
  vertex (426,212);
  vertex (530,212);
  vertex (547,229);
  vertex (547,596);
  vertex (644,594);
  vertex (644,193);
  vertex (569,114);
  vertex (386,114);
  vertex (360,141);
  vertex (360,0);
  vertex (720,0);
  vertex (720,720);
  vertex (0,720);
  vertex (0,0);
 endShape();
 sound = minim.loadFile("m (1).mp3");
 sound.play();
 break;
 }
}

//Intro Screen
void intro () {
background(#87a00a);
//texts
fill(255);
textSize(24);
textAlign(CENTER);
text("Welcome to", width/2, height/2-105);
textSize(54);
text("LETTER LEARNER!", width/2, height/2-55);
textSize(20);
fill(50);
text("Press any letter", width/2, height/2+210);
text("on the keyboard to begin", width/2, height/2+240);
text("Press Backspace or Delete to return here", width/2, height/2+270);
}

//Repeats letter sound and changes texture
void pattern (color obgc,color obgc2, color bgc) {
  float counter = 0;
  background (bgc);
  //begins loop to draw pattern
  while(counter < 500){
  //
  sizeRect = counter/5;
  sizeEllip = counter/5;
  
  //rectangle pattern
  fill(obgc, random(0,100));
  rect(random(width), random(height), sizeRect, sizeRect);

//ellipses pattern
  fill(obgc2, random(0,80));
  ellipse( random(width), random(height), sizeEllip, sizeEllip);
  counter = counter + 1;
  }
}
