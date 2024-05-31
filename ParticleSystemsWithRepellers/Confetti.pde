class Confetti extends Particle {
  
  float angle;
  float angleVel;
  float angleAcc;
  
  Confetti(float lifeSpan) {
    super(lifeSpan);
    angle = 0;
    angleVel = 0;
    angleAcc = 0.001;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    noStroke();
    fill(150, lifeSpan);
    rectMode(CENTER);
    rect(0, 0, 12, 12);
    popMatrix();
  }
  
  void update() {
    super.update();
    angleVel += angleAcc;
    angle += angleVel;
    
  }
}
