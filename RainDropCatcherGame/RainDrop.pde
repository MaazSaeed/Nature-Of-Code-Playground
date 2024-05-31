class RainDrop
{
  float x;
  float y;
  float r;
  float dropSpeed;
  
  RainDrop()
  {
    x = random(1.5*r, width-1.5*r);
    y = -100;
    r = 5;
    dropSpeed = 2;
  }
  
  void display()
  {
    fill(0, 0, 150);
    noStroke();
    for(int i = 2; i < r; i++)
    {
      ellipse(x, y+i*4, i*2, i*2);
    }
  }
  
  void move()
  {
    y += dropSpeed;
  }
  
  boolean collideCatcher(Catcher c_)
  {
    float distance = dist(x, y, c_.x, c_.y);
    if(distance < r + c_.r)
    {
      return true;
    }
    else
    {
      return false;
    }   
  }
    void collided()
    {
      dropSpeed = 0;
      y = -1000;
    }
    
}
