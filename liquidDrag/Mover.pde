class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  
  Mover(float xPos, float yPos, float mass_)
  {
    location = new PVector(xPos, yPos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = mass_;
  }
  
  void display()
  {
    fill(150);
    ellipse(location.x, location.y, mass * 10, mass * 10);
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
  
  void checkEdges()
  {
    if(location.y > height)
    {
      velocity.y *= -1;
      location.y = height;
    }
  
  }
    
  void run()
  {
    display();
    update();
    checkEdges();
  }
  

  
  
  
}
