/**

A sketch to randomly assign research presentation subjects to students.

*/

// starting point for pseudo random generator
int seed = 12345678;

String[] students;
String[] subjects;

void setup() {
  
  size(1100,520);
  
  // a seed ensures the same "random" results each time we run
  randomSeed(12345678);
  
  // load text files into String[] arrays
  students = loadStrings("students.txt");
  subjects = loadStrings("subjects.txt");
  
  // randomly shuffle the arrays 7 times each
  students = shuffleStrings(students, 7);
  subjects = shuffleStrings(subjects, 7);
  
  // we only need to render once
  noLoop();
  
  // white out the background
  background(255);
  
}

void draw(){
  
  // variables for positioning elements
  int tableX=40;
  int tableY=80;
  int buffer=40;
  int studentX=100;
  int subjectX=100;
  int subjectBufferX=275;
  
  // text color = black
  fill(0);
  
  // draw the header first
  textAlign(CENTER,CENTER);
  textSize(24);
  text("Research Presentation Assignments", width/2, 30);
  
  // then the assignments next
  textAlign(LEFT,CENTER);
  textSize(18);
  for(int i = 0; i < students.length ; i++){
    text("Week "+nf(i+4,2),tableX,tableY+(i*buffer));
    text(students[i]+":", tableX+studentX, tableY+(buffer*i));
    for(int j = 0; j < 3 ; j++){
    text(subjects[(i*3)+j], tableX+studentX+subjectX+(j*subjectBufferX), tableY+(buffer*i));
    }
  }
  
  // output the frame as a .png image
  saveFrame("presentationAssignments.png");
  
}

String[] shuffleStrings(String[] _strings, int _iterations){
  
  // first loop repeats the shuffle
  for(int i = 0 ; i <_iterations; i++){
    // second loop works through the String[], shuffling by swapping
    for (int j = 0 ; j < _strings.length; j++){
        // randomly choose an index to swap
        int swap = int(random(_strings.length));
        // store the String in a safe place
        String temp = _strings[j];
        // swap out the Strings
        _strings[j] = _strings[swap];
        _strings[swap] = temp;
    }
  }
  // return a nicely randomized String[]
  return _strings;
  
}
