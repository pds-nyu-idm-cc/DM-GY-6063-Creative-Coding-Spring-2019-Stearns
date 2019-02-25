// A sketch attempting to recreate the work of Bridget Riley
// After examining her work, 'Cool Place',
// the first step is to create the basica element:
// a parallelogram using quad()

// a quad() is created by specifying 4 points counter clockwise
// the x and y coordinates of our 4 points
float[] x = new float[4];
float[] y = new float[4];

// I'm considering the lower left most point to be the start
// we draw a quad in the lower left corner
float quadOriginX=0;
float quadOriginY=height;

// the height of on of the sides
float quadSideHeight=20;
// the width of the quad()
float quadWidth=30;
// the amount the right side is shifted up
float quadSkew=30;

//  calculating our points
x[0]=quadOriginX;
y[0]=quadOriginY;
x[1]=x[0];
y[1]=y[0]-quadSideHeight;
x[2]=quadOriginX+quadWidth;
y[2]=quadOriginY-(quadSideHeight+quadSkew);
x[3]=x[2];
y[3]=y[2]+quadSideHeight;

// turn off the stroke
noStroke();

// draw it!
quad(x[0],y[0],x[1],y[1],x[2],y[2],x[3],y[3]);

// phew... all that code just for a parallelogram...
// I thought this was supposed to be easy!
