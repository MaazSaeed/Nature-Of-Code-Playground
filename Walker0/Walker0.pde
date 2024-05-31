Walker w;

void setup()
{
  background(255);
  size(640, 360);
  w = new Walker();
}

void draw()
{
  w.display();
  w.walk();
}
