Balloon b;
PVector wind;
float t;
float t2;
int totalTime;
int startTime;
float increment;
float increment2;
int totalTimeX;
int startTimeX;
PVector dir;
float nX, nY;
void setup()
{
  size(700, 400);
  b = new Balloon();
  wind = new PVector(0, 0);
  t = random(0, 1000);
  t2 = random(500, 1000);
  totalTime = 5000;
  totalTimeX = 1000;
  startTime = millis();
    startTimeX = millis();

  increment = 0.01;
  increment2 = 0.01;
}

void draw()
{
  background(255);
  
  int passedTime = millis() - startTime;
  
  int passedTimeX = millis() - startTimeX;
  
  nX = map(noise(t), 0, 1, -0.1, 0.1);
  nY = map(noise(t2), 0, 1, -0.1, 0.2);
  
  
    wind.x = nX;
 
    wind.y = nY;

  
      b.applyForce(wind);

  stroke(0);
  
  
  b.display();
  b.update();
  //b.applyForce(b.HeForce);
  //b.decreaseHeForce();
  b.hitEdge();
  
  if(passedTime > totalTime)
  {
    resetNoiseVar();
    startTime = millis();

  }
  
  t += increment;
  t2 += increment2;
  
    showWindDir(wind);

}


void resetNoiseVar()
{
  t = random(200, 1100);
  t2 = random(10, 1000);
  increment = random(0.004, 0.01);
  increment2 = random(0.001, 0.01);
}

void showWindDir(PVector tempWind)
{
  PVector nullVector = new PVector(0, 0);
  PVector w = PVector.sub(tempWind, nullVector);
  
  w.normalize();
  w.mult(20);
  stroke(0);
  translate(b.location.x, b.location.y);
  line(0, 0, w.x, w.y);
  ellipse(w.x, w.y, 5, 5);
  
  println(wind);

}
