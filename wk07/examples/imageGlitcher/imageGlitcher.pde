byte[] raw_bytes;

String srcPath; //source path from loaded file
String desPath; //destination path. defaults to create folder called "output" in the location of the source path
String fileName;
String extension;

// we can speficy a range of bytes to replace
int find_min=200;
int find_max=201;

// and a range of bytes to replace with
int replace_min=2;
int replace_max=5;

/////////////////////////////////////////////////////////
// setup

void setup() {
  
  size(10, 10);

  srcPath = new String();
  desPath = new String();

  noLoop();
  
}

/////////////////////////////////////////////////////////
// draw

void draw() {
  
  background(0);
  
  if (raw_bytes != null) {
    findReplace();
    exit();
  } else {
    open_file();
  }
  
}

/////////////////////////////////////////////////////////
// findReplace

void findReplace() {

  // iterate through the range of bytes we want to find
  for (int find = find_min; find <= find_max; find ++) {
    
    // iterate through the range of bytes we want to replace
    for (int replace = replace_min; replace <= replace_max; replace++) {
      
      // if find and replace a the same, then no change will be made, skip it
      if (find != replace) {
        
        println("Finding "+find+" and replacing it with "+replace);
        
        // create a new byte
        byte[] altered_bytes = new byte[raw_bytes.length];
        
        for (int i = 0; i < raw_bytes.length; i++) {
          
          // if the byte matches the find, write the replace value instead
          if (raw_bytes[i] == byte(find)) {
            altered_bytes[i] = byte(replace);
          } else {
            // otherwise, just copy what's in the original
            altered_bytes[i] = raw_bytes[i];
          }
        }
        
        saveOutput(altered_bytes, find, replace);
        
      }
    }
  }
  println("All finished! Peace out!");
}

/////////////////////////////////////////////////////////
// loadData

void loadData(String _thePath) {
  raw_bytes = loadBytes(_thePath);
  redraw();
}

/////////////////////////////////////////////////////////
// open_file

void open_file() {
  selectInput("Select a file to process:", "inputSelection");
}

/////////////////////////////////////////////////////////
// inputSelection

void inputSelection(File input) {
  
  if (input == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + input.getAbsolutePath());
    srcPath = input.getAbsolutePath();
    parsePath(srcPath);
    loadData(srcPath);
  }
  
}

/////////////////////////////////////////////////////////
// parsePath

void parsePath(String _thePath) {

  String[] dirs = split(_thePath, "/");
  String[] file = split(dirs[dirs.length-1], ".");
  fileName = file[0];
  extension = file[1];
  
  for (int i = 0; i < dirs.length-1; i++) {
    desPath+=dirs[i]+"/";
  }
  
  desPath+="output/";
  println("path: "+desPath);
  println("filename: "+file[0]);
  println("extension: "+file[1]);
  println();
  
}

/////////////////////////////////////////////////////////
// saveOutput

void saveOutput(byte[] _altered_bytes, int _find, int _replace){
  // create the file and path strings
        println(" ...saving... ");
        String newFile = new String(fileName+"_"+_find+"_"+_replace+"."+extension);
        String savedPath = new String(desPath+fileName+"_"+_find+"/");
        String savedFile = new String(savedPath+newFile);
        
        // save the altered array as an image
        saveBytes(savedFile, _altered_bytes);
        
        // open that image and save as .png to "stabilize"
        PImage img = loadImage(savedFile);
        img.save(savedPath+"/PNG/"+fileName+"_"+_find+"_"+_replace+".PNG");        
        println("saved to: "+savedFile);
        println();
}
