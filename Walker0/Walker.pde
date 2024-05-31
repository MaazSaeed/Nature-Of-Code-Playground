class Walker
{
  int x;
  int y;
  
  Walker()
  {
    x = width/2;
    y = height/2;
  }
  
  void display()
  {
    stroke(0);
    point(x, y);
  }
  

  
  void walk()
  {
              
    float chance = random(1);
   
    float dirX = mouseX - x;
    float dirY = mouseY - y;
      
    if(chance < 0.5)
    {
    
      if(dirX != 0)
      {
        dirX /= abs(dirX);
      }
      if(dirY != 0)
      {
        dirY /= abs(dirY);
      }
    
      x += dirX;
      y += dirY;
    }
    else
    {
    float stepX = int(random(3)) - 1; // yields -1, 0, and 1
    float stepY = int(random(3)) - 1; // yields -1, 0, and 1
    
    x += stepX;
    y += stepY;
    
    }
    
    
    
  }
}
