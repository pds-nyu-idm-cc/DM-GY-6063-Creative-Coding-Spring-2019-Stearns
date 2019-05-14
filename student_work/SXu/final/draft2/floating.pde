class floating {
  PVector pos, vel;
  PImage img;
  String type="boat";
  float st;

  floating() {

    pos = new PVector(0, 0);
    vel = new PVector(2, 1);
    //for boats float at different random starttime
    st = random(0, 100);
  }

  void update() {
    if (type=="boat") {
      pushMatrix();
      translate(0, sin(st + frameCount/18.)*2);
      popMatrix();
    }
    if (type=="peopel") {
      pos.x +=1;
      pos.y +=sin(st + frameCount/18.)-1;
    }
  }

  void drawimg() {
    //background(0);
    //pushMatrix();
    //translate(0, sin(st + frameCount/18.)*2);

    if (type == "boat") {
      image(img, pos.x, pos.y);
    }
    if (type == "PEOPLE") {
      image(img, pos.x, pos.y);
    }


    // popMatrix();
    //fill(0, 0.01);
    //rect(0, 0, width, height);
  }


//detect the images
  boolean isMouseInRange () {

    if ((mouseX > (pos.x - img.width/2)) && (mouseX<(pos.x+img.width/2)) 
      && (mouseY>(pos.y-img.height/2)) && (mouseY<(pos.y+img.height/2))) {
      return true ;
    }
    return false;
  }
}
