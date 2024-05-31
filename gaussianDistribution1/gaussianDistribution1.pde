import java.util.Random;

Random generator;
float sdX;
float meanX;
float sdY;
float meanY;
color c;
float cmean;
float sdC;

void setup()
{
  size(400, 360);
  background(220);
  generator = new Random();
 
  meanX = width/2;
  meanY = height/2;
  cmean = 150;
}

void draw()
{
  
  sdX = random(10,150);
  sdY = random(30, 200);
  sdC = random(100, 200);

  
  float numX = (float) generator.nextGaussian();
  float numY = (float) generator.nextGaussian();
  float colorR = (float) generator.nextGaussian(); 
  float colorG = (float) generator.nextGaussian(); 
  float colorB = (float) generator.nextGaussian(); 

  float x = sdX * numX + meanX;
  float y = sdY * numY + meanY;
  float r = sdC * colorR + cmean;
  float g = sdC * colorG + cmean;
  float b = sdC * colorB + cmean;

  strokeWeight(5);
  stroke(r, g, b);
  point(x, y);
  
  println(r);

}
