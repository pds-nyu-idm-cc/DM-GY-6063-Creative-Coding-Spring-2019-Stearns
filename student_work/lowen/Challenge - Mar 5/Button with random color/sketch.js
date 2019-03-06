var rectColor;
var isOverCircle;
 
function setup() 
{
  createCanvas(400, 400);
  
  rectColor = color(255);
}
 
function draw() 
{
  background(255);
  
  
  var radius = 50; 
  
  if(radius < 51)
  {
    isOverCircle = true;
  } else {
    isOverCircle = false;
  }
  
  stroke(0);
  if(isOverCircle == true)
  {
    fill(rectColor);
  }
  rect(200, 200, 100, 100);
  
}
 
function mousePressed()
{
  if(isOverCircle == true)
  {
    rectColor = color(random(255), random(255), random(255));
  }
}
