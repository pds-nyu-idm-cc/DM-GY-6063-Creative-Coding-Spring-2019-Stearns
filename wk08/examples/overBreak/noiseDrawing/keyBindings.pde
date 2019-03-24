void keyPressed() {
  switch(key) {
  // ^ is XOR, true ^ true evaluates to false; false ^ true, evaluates to true
  // ^= is like any other assignment operator (+=, -=, *=, /=, %=, &=, |=)
  case 'p': // toggle path visibility
  showPath^=true;
    break;
  case 'n': // toggle noise visibility
  showNoise^=true; 
    break;
  case 'm': // toggle Mover visibility
  showMover^=true;
    break;
  }
}
