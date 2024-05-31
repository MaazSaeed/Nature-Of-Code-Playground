Catcher c;
RainDrop[] rainDrops;
Timer t;
Timer t2;
int totalDrops = 0;

void setup()
{
  size(400, 500);
  c = new Catcher(25);
  t = new Timer(300); // add a rain-drop into rainDrops array every 4 seconds
  rainDrops = new RainDrop[250]; // create an array for 1000 rain-drops
  t.startTimer(); // startTimer
  rainDrops[0] = new RainDrop();
  t2 = new Timer(2000);
}


void draw()
{
  background(255);
  
  c.display(mouseX, mouseY); // display catcher
  
  for(int i = 0; i < totalDrops; i++)
  {
  rainDrops[i].display();
  rainDrops[i].move();
  
  if(rainDrops[i].collideCatcher(c))
    {
    rainDrops[i].collided();
    c.incrementScore();
    }
  }
  
  
  if(t.isFinished())
  { 
    t.startTimer();
    rainDrops[totalDrops] = new RainDrop();
    totalDrops++;
  
  
  if(totalDrops >= rainDrops.length)
    {
      {
        totalDrops = 0;
        println("your last score: "+c.score);
        c.resetScore();
      }
    }
  }
}
