class Mover
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  boolean falling;
  
  Mover(float x, float y, float m)
  {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    falling = true;
  }
  
  void display()
  {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass * 15, mass * 15);
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);        
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void hitBottom()
  {
    
    if(location.y > height-(mass*15)/2)
    {
      velocity.y *= -1;
      //location.y = height-mass*15/2;
      //falling = false;
    }
    
    if(location.x > width - (mass * 15)/2)
    {
      velocity.x *= -1;
      //location.x = width-(mass*15)/2;
    }
    
    
  }
  
  
}
