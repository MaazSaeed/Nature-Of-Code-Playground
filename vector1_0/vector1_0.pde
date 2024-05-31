
void setup()
{
  size(400, 300);
}

void draw()
{
  background(255);
  
  PVector mouseLoc = new PVector(mouseX, mouseY);
  PVector origin = new PVector(width/2, height/2);

  //PVector arrow = mouseLoc.sub(origin);
  
  stroke(0);
  line(origin.x,origin.y,mouseLoc.x,mouseLoc.y);
  
  
}
