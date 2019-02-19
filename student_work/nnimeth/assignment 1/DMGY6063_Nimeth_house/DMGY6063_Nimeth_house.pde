
  size(640,360);
  background(255);
  
  //rectangle
  stroke(50);
  noFill();
  rect(215,120,200,120);
 
//roof 
//right side
  stroke(50);
  line(200,120,245,75);
  line(200,120,220,120);

 //top line
  line(245,75,385,75);
  
 //left side
  line(385,75,425,120);
  line(425,120,410,120);
  
  //porch 
   stroke(50);
   //right side
   line(190,190,240,170);
   
   //center line
   line(240,170,385,170);
   
   //left line
   line(385,170,435,190);
   //bottom line
   line(190,190,435,190);
   
   //support
   rect(190,190,5,50);
   rect(235,190,5,50);
   rect(280,190,5,50);
   rect(340,190,5,50);
   rect(390,190,5,50);
   rect(430,190,5,50);
 
 //bottom line of porch
   line(190,240,430,240);
  
   //enclose porch
   //line(195,225,215,215);
   //line(430,225,415,215);
   
 //lines in porch 1 right
 line(195,225,235,225);
 //small lines
 line(200,225,200,240);
 line(205,225,205,240);
 line(210,225,210,240);
 line(220,225,220,240);
 line(225,225,225,240);
 line(230,225,230,240);
 
 //lines in porch 2 rights
 line(240,225,280,225);
 //small lines in porch
 line(245,225,245,240);
 line(250,225,250,240);
 line(255,225,255,240);
 line(260,225,260,240);
 line(265,225,265,240);
 line(270,225,270,240);
 line(275,225,275,240);
 
 //lines in porch left 1
 line(345,225,390,225);
 
 //small lines in porch
 line(350,225,350,240);
 line(355,225,355,240);
 line(360,225,360,240);
 line(365,225,365,240);
 line(370,225,370,240);
 line(375,225,375,240);
 line(380,225,380,240);
 line(385,225,385,240);
 
 //lines in porch left 2
 line(395,225,430,225);

//small lines in porch
line(400,225,400,240);
line(405,225,405,240);
line(410,225,410,240);
line(415,225,415,240);
line(420,225,420,240);
line(425,225,425,240);

//windows lower level
//right
rect(220,195,5,25);
rect(225,195,15,25);
line(230,195,230,220);//vertical
line(225,201,235,201);//horizontal
line(225,208,235,208);//horizontal
line(225,215,235,215);//horizontal

rect(248,195,5,25);
rect(268,195,5,25);
rect(253,195,15,25);
line(258,195,258,220);//vertical
line(263,195,263,220);//vertical
line(253,201,267,201);//horizontal
line(253,208,267,208);//horizontal
line(253,215,267,215);//horizontal

//left
rect(355,195,15,25);
rect(365,195,15,25);
rect(360,195,15,25);
line(365,195,365,220);//vertical
line(370,195,370,220);//vertical
line(360,201,374,201);//horizontal
line(360,208,374,208);//horizontal
line(360,215,374,215);//horizontal

rect(395,195,15,25);
rect(390,195,15,25);
line(400,195,400,220);//vertical
line(395,201,405,201);//horizontal
line(395,208,405,208);//horizontal
line(395,215,405,215);//horizontal

//windows upper level 
rect(220,130,15,25);
rect(230,130,15,25);
rect(225,130,15,25);
line(230,155,230,130);//vertical
line(235,155,235,130);//vertical
line(225,136,240,136);//horizontal
line(225,143,240,143);//horizontal
line(225,150,240,150);//horizontal

rect(250,130,15,25);
rect(255,130,15,25);
rect(260,130,15,25);
line(260,155,260,130);//vertical
line(265,155,265,130);//vertical
line(255,136,270,136);//horizontal
line(255,143,270,143);//horizontal
line(255,150,270,150);//horizontal

rect(300,130,15,25);
rect(305,130,15,25);
rect(310,130,15,25);
line(310,155,310,130);//vertical
line(315,155,315,130);//vertical
line(305,136,320,136);//horizontal
line(305,143,320,143);//horizontal
line(305,150,320,150);//horizontal

rect(355,130,15,25);
rect(360,130,15,25);
rect(365,130,15,25);
line(365,155,365,130);//vertical
line(370,155,370,130);//vertical
line(360,136,375,136);//horizontal
line(360,143,375,143);//horizontal
line(360,150,375,150);//horizontal

rect(385,130,15,25);
rect(390,130,15,25);
rect(395,130,15,25);
line(395,155,395,130);//vertical
line(400,155,400,130);//vertical
line(390,136,405,136);//horizontal
line(390,143,405,143);//horizontal
line(390,150,405,150);//horizontal

  
//windows roof  
  rect(265,75,15,20);
  rect(267,78,10,15);
  line(270,78,270,93);//vertical
  line(274,78,274,93);//vertical
  line(268,82,276,82);//horizontal
  line(268,89,276,89);//horizontal
  triangle(260,75,272,65,285,75);
  triangle(280,75,287,80,280,95);
  
  
  rect(305,75,15,20);
  rect(307,78,10,15);
  line(310,78,310,93);//vertical
  line(314,78,314,93);//vertical
  line(307,82,316,82);//horizontal
  line(307,89,316,89);//horizontal
  triangle(300,75,312,65,325,75);
  
  
  rect(345,75,15,20);
  rect(347,78,10,15);
  line(350,78,350,93);//vertical
  line(354,78,354,93);//vertical
  line(347,82,356,82);//horizontal
  line(347,89,356,89);//horizontal
  triangle(340,75,352,65,365,75);
  triangle(345,75,337,80,345,95);
  
  //garage 
 // rect(500,180,100,60);
  
//Tree
triangle(120,170,132,150,145,170);
line(120,175,105,205);
line(163,205,145,175);
line(105,205,163,205);
rect(130,205,5,25);



  
//around door 
rect(295,195,8,45);
line(295,203,330,203);
square(297,197,4); 
square(297,208,4); 
square(297,214,4); 
square(297,220,4); 
square(297,226,4);

rect(303,195,19,8);
square(305,197,4);
square(311,197,4);
square(317,197,4);

rect(322,195,8,45);
square(324,197,4);
square(324,208,4); 
square(324,214,4); 
square(324,220,4); 
square(324,226,4);

//door
fill(190,0,0);
rect(305,205,15,35);
rect(307,209,4,5);
rect(307,217,4,9);
rect(307,229,4,9);
rect(314,209,4,5);
rect(314,217,4,9);
rect(314,229,4,9);
