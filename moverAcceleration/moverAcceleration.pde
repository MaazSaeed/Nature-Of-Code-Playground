Mover[] movers;

void setup()
{
  size(640, 360);
  movers = new Mover[1];
  movers[0] = new Mover();
}

void draw()
{
  //background(255);
  
  for(int i = 0; i < movers.length; i++)
  {
    movers[i].display();
    movers[i].accelerate();
    //movers[i].constrainLocation();
  }
  
}


// add a new mover object to the end of the array.
void mousePressed()
{
  Mover newMover = new Mover();
  movers = (Mover[]) append(movers, newMover);
}
