void keyPressed(){
  switch(key){
    case 'b':
    mode = "BOUNCE";
    println("Mode set to: "+mode);
    break;
    case 'w':
    mode = "WRAP";
    println("Mode set to: "+mode);
    default:
    break;
  }
}
