class Mover {
  PVector location, velocity, acceleration;
  float w, h;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    w = 30;
    h = 30;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rectMode(CENTER);
    noStroke();
    fill(100);
    rect(0, 0, w, h);
    stroke(0);
    strokeWeight(2);
    line(0, 0, 0, -w);
    popMatrix();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
        //acceleration.add(force);
    velocity.add(acceleration);
    velocity.mult(0.9);
    velocity.limit(4);
    location.add(velocity);
    
    acceleration.mult(0);
  
  }
  void checkEdges() {
    if(location.x > width) {
      location.x = 0;
    }
    
    if(location.x < 0) {
      location.x = width;
    }
    
    if(location.y > height) {
      location.y = 0;
    }
    
    if(location.y < 0) {
      location.y = height;
    }
    
  
  }
  
}
