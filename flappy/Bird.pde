class Bird {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  
  Bird() {
    location = new PVector(width/5, height/4);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    force = new PVector(0, -1);
  } 
  
  void drawBird() {
    noStroke();
    fill(100);
    ellipse(location.x, location.y, 40, 30);
    location.y = constrain(location.y, 0, height);
  }
  
  void applyGravity(PVector force_) {
    acceleration.add(force_);
  }
  
  void updateVectors() {
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    velocity.mult(0.98);
  }
  
  void moveUp() {
    acceleration.add(force);
  }
  

}