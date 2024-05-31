class Mover
{
  PVector location, velocity, acceleration;
  float topSpeed;
  color colour;
  
  Mover()
  {
    PVector randomLocation = new PVector(random(width), random(height));
    location = randomLocation;
    velocity = new PVector(0, 0);
    topSpeed = 10;
    colour = color(random(255), random(255), random(255));
  }
  
  void display()
  {
    stroke(colour);
    strokeWeight(8);
    point(location.x, location.y);
  }
  
  void accelerate()
  {
    PVector mouseLocation = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouseLocation, location);
    direction.normalize();
    direction.mult(0.5);
    
    acceleration = direction;
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topSpeed);
    
  }

  /*
  void constrainLocation()
  {
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);
  }
  */
  
  
}
