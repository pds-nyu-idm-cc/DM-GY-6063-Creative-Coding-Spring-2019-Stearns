//changes colors of the particles & lines over time
void colorChanging() {
  p0fill = lerpColor(p0color, p0colorChange, smoothStep(0.2, 0.7, cStep));
  p1fill = lerpColor(p1color, p1colorChange, smoothStep(0.2, 0.7, cStep));

  cStep += 0.01;

  if ( cStep > 1.5) {
    cStep = 0.0;
    p0color= p0colorChange;
    p0colorChange = color (random(98, 255), random(68, 220), random(136, 255));
    p1color= p1colorChange;
    p1colorChange = color (random(10, 63), random(10, 95), random(10, 212));
  }

  //uncomment here to check if the colors are actually changing!!!
  //println(cStep,pfill,p1fill);
}

//changes every 1.5 step
float smoothStep(float index0, float index1, float cStep) {
  cStep = constrain((cStep - index0) / (index1 - index0), 0.0, 1.5); 
  return cStep * cStep;
}
