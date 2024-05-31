Mover[] movers;
Liquid l;

float liquidConstt = 0.05;
float[] xPos;

void setup()
{
  size(700, 500);
  movers = new Mover[8];
  l = new Liquid(0, height*0.6, width, height*0.4, liquidConstt, color(10, 40, 150));
  
  xPos = new float[movers.length];
  resetMovers();


}

void draw()
{
  background(255);
  l.display();

  for(int i = 0; i < movers.length; i++)
  {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].applyForce(gravity);
    movers[i].run();
    if(l.insideLiquid(movers[i]))
    {
      PVector dragForce = l.calcDrag(movers[i]);
      movers[i].applyForce(dragForce);
    }
    
  }

}

void mousePressed()
{
  resetMovers();
}

void resetMovers()
{
    for(int i = 0; i < movers.length; i++)
  {
    
    float randomPos = random(width*0.1, width *0.95);
    float randomMass = random(0.5, 5);
    movers[i] = new Mover(randomPos, 30, randomMass);
   
 
  }
}
