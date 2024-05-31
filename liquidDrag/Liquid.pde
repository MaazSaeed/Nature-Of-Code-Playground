class Liquid
{
  float x, y, w, h;
  float liquidConstant;
  color colour;
  Liquid(float x_, float y_, float w_, float h_, float liquidConstant_, color colour_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    liquidConstant = liquidConstant_;
    colour = colour_;
  }
  
  void display()
  {
    fill(colour);
    rect(x, y, w, h);
  }
  
  boolean insideLiquid(Mover m)
  {
    PVector location = m.location.get();
    
    if( location.y > y && location.y < (y+h) && location.x > x && location.x < (x + w))
    {
      return true;
    }
    else 
    {
      return false;
    }  
  }
  
    
  PVector calcDrag(Mover m)
  {
    PVector drag = PVector.div(m.velocity, 1);
    float speed = drag.mag();
    float dragMagnitude = -1 * (liquidConstant * speed * speed);
    drag.normalize();
    drag.mult(dragMagnitude);
    return drag;
  }
  
  
  
}
