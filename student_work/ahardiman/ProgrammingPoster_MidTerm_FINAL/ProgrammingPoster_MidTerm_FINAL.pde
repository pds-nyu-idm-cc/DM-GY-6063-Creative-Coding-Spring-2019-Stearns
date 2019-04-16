//Alberta Hardiman
//Programming Poster
//Midterm Project, Creative Coding Spring 2019

PFont font;
ArrayList<BasicGraphics> sqs;

void setup(){
  size(600,800);
    smooth(2);
  sqs = new ArrayList<BasicGraphics>();
  sqs.add(new TwoPointLine(new PVector(250,300)));   //pvector: location
  sqs.add(new BasicGraphics(new PVector(350,300))); 
  sqs.add(new RotatingSquare(new PVector(450,300))); 
  sqs.add(new MovingBall(new PVector(250,400))); 
  sqs.add(new FiveBallExplode(new PVector(350,400)));
  sqs.add(new ConfusedBall(new PVector(450,400)));
  sqs.add(new FourSquares(new PVector(250,500)));
  sqs.add(new MovingLines(new PVector(350,500)));
  sqs.add(new JitterCircle(new PVector(450,500)));
  sqs.add(new Type(new PVector(25,100)));
  sqs.add(new Footnote(new PVector(450,720)));
  sqs.add(new FootnoteLeft(new PVector(25,720)));
  sqs.add(new FootnoteCenter(new PVector(200,720)));
}
void draw(){
  background(#4841C0);
  for (BasicGraphics sq : sqs){
    sq.draw();
  }
}
