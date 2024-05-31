int[] randomCounts;

void setup()
{
  size(640, 360);
  background(255);
  randomCounts = new int[20];
}

void draw()
{
  background(255);
  int index = int(random(randomCounts.length));
  
  randomCounts[index]++;
  
  int w = width/randomCounts.length;
  
  for(int i = 0; i < randomCounts.length; i++)
  {
    fill(100);
    rect(i*w, height-randomCounts[i], w, randomCounts[i]);
  }
  
  
}
