float x;
int totalTime = 5000;
int startTime;

void setup()
{
  size(300, 300);
  startTime = millis();
}

void draw()
{
  background(220);
  
  int passedTime = millis() - startTime;
  
  if(passedTime > totalTime)
  {
    println(passedTime/1000);
  }
  
  
  stroke(0);
  strokeWeight(2);
  point(x, height/2);
  
  
  
  
  x++;
}
