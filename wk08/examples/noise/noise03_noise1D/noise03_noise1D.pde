float pos=0.0; // initial position for the noise() function
float dpos=0.01; // the amount we shift the position
float dx=0.025;
float[] yvalues;
float amplitude;
int xspacing = 1;
int w = 0;
int seed = 9999;
int octaves = 3;
float falloff = .5;

void setup(){
  size(600,300);
  background(0);
  w = width+xspacing;
  yvalues=new float[w/xspacing];
  amplitude=height/2;
  noiseSeed(seed);
  noiseDetail(octaves, falloff);
}

void draw(){
  background(0);
  calcNoise();
  renderNoise();
}

void calcNoise(){
  pos += dpos;
  float x = pos;
  for(int i = 0; i < yvalues.length; i++){
    yvalues[i] = (noise(x)-.5)*amplitude;
    x+=dx;
  }
}

void renderNoise(){
  stroke(255);
  strokeWeight(2);
   for (int x = 0; x < yvalues.length; x++) {
    point(x*xspacing, (height/2)+yvalues[x]);
  }
}
