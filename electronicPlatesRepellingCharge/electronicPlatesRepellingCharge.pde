Mover[] movers;
float dissipateStrength = 0.06;
PVector wind = new PVector(0.005, 0);

void setup()
{
  size(640, 400);
  movers = new Mover[5];
  
  for(int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(random(width), height * 0.2, random(1, 3));
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < movers.length; i++)
  {
    movers[i].display();
    movers[i].update();
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1*m);
    movers[i].applyForce(gravity);
    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.normalize();
    friction.mult(-c);
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);

    movers[i].hitBottom();
  }
 /*   
  if(movers[i].location.x > width/2)
  {
    PVector boundary = new PVector(0, 0);
    boundary.x = map(movers[i].location.x, width/2, width, -0.3, -1);
    movers[i].applyForce(boundary);
  }
  if(movers[i].location.x < width/2)
  {
    PVector boundary = new PVector(0, 0);
    boundary.x = map(movers[i].location.x, 0, width/2, 1 , 0.3);
    movers[i].applyForce(boundary);
  }
  }
  */
  
}
