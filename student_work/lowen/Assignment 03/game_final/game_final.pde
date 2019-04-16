// Lauren Owen
// This game is to encourage girls to get interested in science
// A Mario inspired game in its early draft

int ratX;
int ratY;
int ratSpeed;
int enemiesX;
int enemiesY;
float a;
PImage bg;
PImage labRat;
PImage syringe;



void setup() {
  size(939, 400);
  bg = loadImage("background2.png");
  labRat =  loadImage("labrat.png");
  
  
  ratX = 50;
  ratY = 365;
  ratSpeed = 15;
  
  enemiesX = 800;
  enemiesY = 365;
  
  a = width/2;
}

void draw() {
  background(bg);
  image(labRat, ratX, ratY);
  
  syringe();
  
  

}

//Finally!
//I realized that te values for height and width needed to be integers
//Separating them allowed me to control the movement
void keyPressed() {
  if ( (keyCode == LEFT) && (ratX > 10) ){
    ratX = ratX - ratSpeed;
    
  } 
   if ((keyCode == RIGHT) && (ratX < 860) ){
    ratX = ratX + ratSpeed;
  }
  if ((keyCode == UP) && (ratY > 350) )
  {
    ratY = ratY - ratSpeed*2;
  }
  
  if ((keyCode == DOWN) && (ratY < 350) )
  {
    ratY = ratY + ratSpeed*2;
  }
  
}

void syringe()
{
  syringe = loadImage("syringe.png");
  image(syringe,a,370);
  a = a - 3;
  if (a < 0) { 
    a = width; 
  }
  
}

//Lauren Owen
