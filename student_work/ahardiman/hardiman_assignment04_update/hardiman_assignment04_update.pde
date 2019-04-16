int x,y;
color c;

void setup(){
  x=50;
  y=50;
  c=color(255,0,0);
  size(800,600);
}

void draw(){
  background(c);
  stroke(255);
  strokeWeight(3);
  //for loop
  for(int i=0;i<width;i+=x){
    line(i,0,i,height);
  }
  
  
  for(int i=0;i<height;i+=y){
    line(0,i,width,i);
  }
  
  fill(255);
  if (dist(mouseX,mouseY,width/2,height/2)<50){
    fill(200);
  }
  ellipse(width/2,height/2,50,50);
}

void mousePressed(){
  if (dist(mouseX,mouseY,width/2,height/2)<50){
    println("Boom");
    
    float ran=random(0,100);
    if (ran<30){
      x+=random(-20,20);  
    }else if (ran<60){ //else if means "or" so if this happens, "or this", "or this". 
      y+=random(-20,20); 
    }else{
      c= color(random(0,255),random(0,255),random(0,255));
    }
  }
}
