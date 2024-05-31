class Bird {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector thrust;
  PImage img;
  float theta;
  float w = 40;
  
  Bird() {
    location = new PVector(50, 100);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    thrust = new PVector(0, -10);
    img = loadImage("swaggy-bird-flappy-bird.png");
    theta = 0.2;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    imageMode(CENTER);
    rotate(theta);
    image(img, 0, 0, w, w);
    location.y = constrain(location.y, 0, height);
    theta = constrain(theta, -0.2, 1.5);
    popMatrix();
  }
  
  void applyForce(PVector force_) {
    acceleration.add(force_);
    theta -= 0.07;
  }
  
  void applyGravity(PVector force_) {
    acceleration.add(force_);
    theta += 0.01;
  }
  
  void update() {
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   velocity.mult(0.95);
  }
  
  PVector getThrust() {
    return thrust;
  }
  
  float getX() {
    return location.x;
  }
  
  float getY() {
    return location.y;
  }
  
  float getW() {
    return w;
  }
  
  void animate() {   
  }
  
  void setY(float setY_) {
    location.y = setY_;
  }
    
    
}