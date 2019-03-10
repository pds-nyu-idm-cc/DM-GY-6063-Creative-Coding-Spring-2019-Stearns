// Sketch by Purin Phanichphant
// http://purin.co/Experiments-with-P5-js



// All the paths
var paths = [];
// Are we painting?
var painting = false;
// How long until the next circle
var next = 0;
// Where are we now and where were we?
var current;
var previous;

function setup() {
  createCanvas(windowWidth, windowHeight);
  current = createVector(0,0);
  previous = createVector(0,0);
}

function draw() {
  background(255);

  // If it's time for a new point
  if (millis() > next && painting) {

    // Grab mouse position
    //current.x = mouseX;
    current.y = ((int(mouseY/50))*50);
    current.x = ((int(mouseX/87))*87);
    //current.y = int((mouseY/100)*100);

    // New particle's force is based on mouse movement
    var force = p5.Vector.sub(current, previous);
    force.mult(0.05);

    // Add new particle
    paths[paths.length - 1].add(current, force);

    // Schedule next circle
    next = millis() + 1000;

    // Store mouse values
    previous.x = current.x;
    previous.y = current.y;
  }

  // Draw all paths
  for( var i = 0; i < paths.length; i++) {
    paths[i].update();
    paths[i].display();
  }


}

// Start it up
function mousePressed() {
  next = 0;
  painting = true;
  previous.x = ((int(mouseX/87))*87);
  //previous.y = mouseY;
  previous.y = ((int(mouseY/50))*50);
  paths.push(new Path());
  println(mouseX);
  println(previous.x);
}

// Stop
function mouseReleased() {
  painting = false;
}

// A Path is a list of particles
function Path() {
  this.particles = [];
  this.hue = random(50);
}

Path.prototype.add = function(position, force) {
  // Add a new particle with a position, force, and hue
  this.particles.push(new Particle(position, force, this.hue));
}

// Display plath
Path.prototype.update = function() {
  for (var i = 0; i < this.particles.length; i++) {
    this.particles[i].update();
  }
}

// Display plath
Path.prototype.display = function() {

  // Loop through backwards
  for (var i = this.particles.length - 1; i >= 0; i--) {
    // If we shold remove it
    if (this.particles[i].lifespan <= 0) {
      this.particles.splice(i, 1);
    // Otherwise, display it
    } else {
      this.particles[i].display(this.particles[i+1]);
    }
  }

}

// Particles along the path
function Particle(position, force, hue) {
  this.position = createVector(position.x,position.y);
  this.velocity = createVector(force.x, force.y);
  this.drag = 0.95;
  this.lifespan = 255;
  this.size = 5;
}

Particle.prototype.update = function() {
  // Move it
  this.position.add(this.velocity);
  // Slow it down
  this.velocity.mult(this.drag);
  // Fade it out
  //this.lifespan = this.lifespan-1;
  if(this.size < 100){
  this.size = this.size+2;
  }
}

// Draw particle and connect it with a line
// Draw a line to another
Particle.prototype.display = function(other) {
  noStroke();
  fill('rgba(185,219,159, 1)');
  quad(this.position.x, this.position.y,
      this.position.x-87, this.position.y-50,
      this.position.x-87, this.position.y-50 - this.size,
      this.position.x, this.position.y - this.size);

  fill('rgba(152,169,128, 1)');
  quad(this.position.x, this.position.y,
      this.position.x, this.position.y - this.size,
      this.position.x+87, this.position.y-50 - this.size,
      this.position.x+87, this.position.y-50);

  fill('rgba(195,238,187, 1)');
  quad(this.position.x, this.position.y - this.size,
      this.position.x-87, this.position.y-50 - this.size,
      this.position.x, this.position.y-100 - this.size,
      this.position.x+87, this.position.y-50 - this.size);
  //ellipse(this.position.x,this.position.y-(this.size*20), this.size, this.size);
  //println(this.lifespan);
  // If we need to draw a line
  //if (other) {
  //  line(this.position.x, this.position.y, other.position.x, other.position.y);
  //}
}
