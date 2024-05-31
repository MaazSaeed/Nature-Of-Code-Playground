class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan;
  float angle;
  float angleVel;
  
  Particle(PVector location_) {
    lifespan = 255;
    location = location_.copy();
    velocity = new PVector(random(-1, 1), random(-2,0));
    acceleration = new PVector(0, 0);
    angle = 0;
    angleVel = 0.05;
  }
  
  void run() {
    update();
    display();
  }
  
  void display() {
    stroke(0, lifespan);
    fill(0, lifespan);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, 10, 10);
    popMatrix();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    lifespan -= 1;
    angle += angleVel;
    acceleration.mult(0);
    

  }
  
  boolean isDead() {
    if(lifespan < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
}
