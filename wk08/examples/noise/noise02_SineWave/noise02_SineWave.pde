/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 */
 
int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float thetaStep = 0.01; // Angular Velocity
int qty_components = 3;
float amplitude = 100/qty_components;  // Height of wave
float period;  // How many pixels before the wave repeats
float[] dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(640, 360);
  period = width;
  w = width+xspacing;
  dx = new float[qty_components];
  
  for(int i = 0 ; i < dx.length ; i++){
    dx[i]=((TWO_PI / period) * xspacing)+(random(.05)*i);
  }
  
  //dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += thetaStep;

  // For every x value, calculate a y value with sine function
  float[] x = new float[qty_components];
  for (int i = 0 ; i < x.length ; i++){
    x[i] = theta;
  }
  yvalues = new float[w/xspacing];
  for (int i = 0; i < yvalues.length; i++) {
    for (int j = 0 ; j < qty_components; j++){
    yvalues[i] += sin(x[j])*amplitude;
    x[j]+=dx[j];
    }
  }
}

void renderWave() {
  stroke(255);
  strokeWeight(2);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    point(x*xspacing, height/2+yvalues[x]);
  }
}
