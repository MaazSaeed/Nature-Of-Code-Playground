class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifeSpan;
  
  Particle(float lifeSpan_) {
    location = new PVector(random(width/2, width*0.52), random(10,15));
    velocity = PVector.random2D();
    velocity.mult(0.9);
    acceleration = new PVector(0, 0);
    lifeSpan = lifeSpan_;
  }
  
  void display() {
    noStroke();
    fill(100, lifeSpan);
    ellipse(location.x, location.y, 8, 8);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    lifeSpan -= 1;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void run() {
    display();
    update();
  }
  
  boolean isDead() {
    if(lifeSpan < 0) {
      return true;
    }
    else {
      return false;
    }   
  }
}
