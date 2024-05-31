class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float angle;
  float aVel;
  float aAcc;
  float w, h;
  
  Mover(float m_, float w_, float h_) {
    
    mass = m_;
    w = w_;
    h = h_;
    location = new PVector(mass*w, height - mass * h);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    angle = 0;
    aVel = 0;
    aAcc = 0;

  }
  
  void display() {
    fill(150);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, mass * w, mass * h);
    popMatrix();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    aVel += aAcc;
    angle += aVel;
    
    aVel = constrain(aVel, -0.1, 0.1);
  }
  
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(force);
    //aAcc += f.x/10;
  }
  
  void checkEdges() {
    
    // literallt stun the object when it hits the ground and orient it in normal conformation;
    if(location.y >= height-((mass*w)/2)) {
      velocity.mult(0);
      location.y = height-((mass*w)/2);
      angle = 0;
      aVel = 0;
      aAcc = 0;
    }
    
    if(location.x > width-((mass*w)/2)) {
      //velocity.mult(0);
      velocity.x *= 0;
      angle = 0;
      aVel = 0;
      aAcc = 0;
   }
    
     if(location.x < ((mass*w)/2)) {
      //velocity.mult(0);
            velocity.x *= 0;

      angle = 0;
      aVel = 0;
      aAcc = 0;
    }
    
    
    
  
  }
  
  void run()
  {
    display();
    update();
    checkEdges();
  }
  
  
  
  
  

}
