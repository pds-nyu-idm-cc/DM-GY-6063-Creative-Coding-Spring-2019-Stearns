int x=250;
int y=250;
int bgcolor = 0;
int begin; 
int duration = 60;
int time = 60;
PFont font;
int w=20; 
boolean foodKey = true;
int foodX;
int foodY;
int score = 0;

void setup(){

  // set screen size
  size(500, 500);
  
  // set starting background color
  background(255);
  begin = millis();   
  
}

void draw(){
  background(bgcolor);
  bgcolor++;
  // blank out canvas
  
  
  // style our shape
  strokeWeight(1);
  stroke(0);
  fill(127);
  
  // draw shape
  //triangle(425,375,400,400,450,400);
  //triangle(450,400,475,425,450,450);
  //triangle(450,450,425,475,400,450);
  //triangle(400,450,375,425,400,400);
  ellipse(x,y,20,20);
  
   if (time > 0){  
    time = duration - (millis() - begin)/1000;
    text(time, 80, 80);
   }
   else {
     font = createFont("Arial", 30);
     textFont(font);
     text("Game Over", 200,200);
   }
   drawFood(width,height);
   //println("dd");
   //println(x);
   //println("ff");
   //println(y);
   //println("vv");
   //println(foodX);
   //println("vbb");
   //println(foodY);
   if( x <=foodX+10 && x>= foodX-10&&y >= foodY-10&&y<=foodY+10) {
     //println("lll");
     foodKey = true;
     score++;
   }
    text(score, 400,400);
}

void keyPressed(){
  println("Key pressed: "+key);
  println("Keycode pressed: "+keyCode);
  
  if (keyCode == 38){
   for(int counter = 0; counter < 10; counter++){ 
    y = y - 1;
   }
  }else if (keyCode == 40){
    y = y + 10;
  }else if (keyCode == 37){
    x = x - 10;
  }else if (keyCode == 39){
    x = x + 10;
  }
    
}
void drawFood(int maxWidth, int maxHeight){
    fill(#ED1818);
    if(foodKey){
        foodX = int( random(0, maxWidth)/w ) * w;
        foodY = int( random(0, maxHeight)/w) * w;
    }
    rect(foodX, foodY, w, w);
    foodKey = false;
}
