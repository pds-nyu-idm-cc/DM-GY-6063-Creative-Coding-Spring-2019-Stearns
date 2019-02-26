
void setup(){
  size(1200,850);
  background(255,255,255);
}

void draw(){
  
  //bottom left rect, garage
      stroke(0);
      strokeWeight(2);
      fill(153);
      rect(200,600,300,200);
  
  //garage door
      fill(255,255,255);
      stroke(0);
      rect(225,635,250,165);
      line(225,650,475,650);
      line(225,665,475,665);
      line(225,680,475,680);
      line(225,695,475,695);
      line(225,710,475,710);
      line(225,725,475,725);
      line(225,740,475,740);
      line(225,755,475,755);
      line(225,770,475,770);
      line(225,785,475,785);
  
  //bottom right rect,
      fill(255,255,255);
      stroke(0);
      strokeWeight(2);
      rect(500,600,300,200);
  
      //door
          rect(525,635,85,165);
          circle(540,717.5,10);
      
      //window next to door
          fill(168,204,215);
          rect(635,635,140,120);
          line(705,635,705,755);
          line(635,695,775,695);
  
  //second right rect,
      fill(255,255,255);
      strokeWeight(2);
      rect(500,400,300,200);
  
      //windows
          fill(168,204,215);
          rect(575,435,60,120);
            line(605,435,605,555);
            line(575,475,635,475);
            line(575,515,635,515);
          rect(645,435,60,120);
            line(675,435,675,555);
            line(645,475,705,475);
            line(645,515,705,515);
          rect(715,435,60,120);
            line(745,435,745,555);
            line(715,475,775,475);
            line(715,515,775,515);
 
  //glass fence?
      fill(168,204,215);
      noStroke();
      tint(0,0,255,100);
      rect(260,325,240,50);
    
  //third right rect,
      stroke(0);
      strokeWeight(2);
      fill(255,255,255);
      rect(500,200,300,200);
      
      //window
          fill(168,204,215);
          rect(525,235,250,110);
  
  //left floating box
      stroke(0);
      strokeWeight(2);
      fill(255,255,255);
      beginShape();
        vertex(250,615);
        vertex(550,615);
        vertex(550,375);
        vertex(250,375);
      endShape(CLOSE);
      fill(168,204,215);
      rect(270,400,260,190);
  
  //triangle roof
      fill(153);
      stroke(0);
      strokeWeight(2);
      triangle(475,200,650,100,825,200);
  
  //right side door
      beginShape();
        vertex(800,560);
        vertex(931.25,635);
        vertex(800,635);
        vertex(800,560);
      endShape();
      line(800,800,905,800);
      stroke(0);
      strokeWeight(2);
      line(905,635,905,800);
      
      //fence
          line(800,755,905,755);
          line(835,755,835,800);
          line(870,755,870,800);
      
      //light wires
          stroke(0);
          strokeWeight(1);
          line(897,635,897,650);
          line(882,635,882,650);
          line(867,635,867,650);
          line(852,635,852,650);
          line(837,635,837,650);
          line(822,635,822,650);
          line(807,635,807,650);
      
      //lights
          noStroke();
          int m = millis();
          fill(m % 250,218,94);
          circle(897,650,8);
          circle(882,650,8);
          circle(867,650,8);
          circle(852,650,8);
          circle(837,650,8);
          circle(822,650,8);
          circle(807,650,8);
     
     
 //legend 1
     fill(168,204,215);
     noStroke();
     rect(950,100,80,40);
     
     fill(0);
     text("glass window",1040, 125);
     textSize(20);
     
 //legend 2
     noStroke();
     int m1 = millis();
     fill(m % 250,218,94);
     circle(990,175,20);
     
     fill(0);
     text("light",1040, 180);
     textSize(20);     
     
 
}
