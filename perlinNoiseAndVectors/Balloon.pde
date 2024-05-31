class Balloon
{
  PVector location;
  PVector velocity;
  PVector acceleration; 
  PVector HeForce; // HeForce is for force due to helium gas
  
  float w, h;
  float mass;
  
  Balloon()
  {
    w = 40;
    h = 52;
    mass = 3;
    location = new PVector(w*2+10, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    HeForce = new PVector(0, -1);
  }
  
  void display()
  {
    fill(155);
    noStroke();
    ellipse(location.x, location.y, w, h);
  }
  
  void update()
  {
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  void decreaseHeForce()
  {
    HeForce.y = lerp(HeForce.y, 0, 0.2);
  }
  
  void hitEdge()
  {
    
    if(location.x > width - w/2)
    {
      velocity.x *= -1;
    }
    if(location.x < w/2)
    {
      velocity.x *= -1;
    }
    if(location.y > height - h/2)
    {
      velocity.y *= -1;
    }
    if(location.y < h/2)
    {
      velocity.y *= -1;
    }
    

  }
  
  
  public float getX()
  {
    return location.x;
  }
  
  public float getY()
  {
    return location.y;
  }
  
  
  
 
}
