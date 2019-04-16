void drawShapes(){
   //some art/shapes in margin

  //left side
  //initialize variabyles
  x=width/32;  //reference point x-axis
  y=height/8;  //reference point y-axis
  shapeSize=width/16; //all shapes have same width&height
  //increments
  stepY=-50;
  //start shapes
  noStroke();

  //shape #1

  //set location
  x1=x;
  x2=x+shapeSize;
  y1=y;
  y2=y+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  quad(x1, y1, x2, y1, x1, y2, x2, y2);

  //shape #2

  //change location
  x1=x+shapeSize/2;
  y1=y*3;
  //draw shape
  fill(random (256), random (256), random (256));
  circle(x1, y1, shapeSize);

  //shape #3

  //change location
  x1=x;
  y1=y*4+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));  
  square(x1, y1, shapeSize);

  //shape #4

  //change location
  x1=x;
  x2=x+shapeSize;
  y2=y+height*6/8;
  y1=y2-shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  triangle(x1, y2, x2, y2, x+shapeSize/2, y1);

  //right side
  //initialize variabyles
  x=width-width*3/32;  //reference point x-axis
  y=height/8;  //reference point y-axis
  shapeSize=width/16; //all shapes have same width&height
  //increments
  stepY=-10;
  //start shapes
  noStroke();

  //shape #5

  //set location
  x1=x;
  x2=x+shapeSize;
  y1=y;
  y2=y+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  quad(x1, y1, x2, y1, x1, y2, x2, y2);

  //shape #6

  //change location
  x1=x+shapeSize/2;
  y1=y*3;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  circle(x1, y1, shapeSize);

  //shape #7

  //change location
  x1=x;
  y1=y*4+shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));  
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  square(x1, y1, shapeSize);

  //shape #8

  //change location
  x1=x;
  x2=x+shapeSize;
  y2=y+height*6/8;
  y1=y2-shapeSize;
  //draw shape
  fill(random (256), random (256), random (256));
  //wrap around
  y1=(y1+height) % height;
  y2=(y2+height) % height;
  triangle(x1, y2, x2, y2, x+shapeSize/2, y1); 
}
