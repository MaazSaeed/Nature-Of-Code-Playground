float theta = 0;

void setup()
{
  size(200, 200);
}

void draw()
{
  background(255);
  translate(width/2, height/2);
  noStroke();
  fill(200, 200, 0);
  ellipse(0, 0, 50, 50);
  
  pushMatrix();
  rotate(theta);
  translate(50, 0);
  fill(0, 200, 0);
  ellipse(0, 0, 20, 20);
  
  pushMatrix();
  rotate(-theta*4);
  translate(15, 0);
  fill(0, 0, 100);
  ellipse(0, 0, 6, 6);
  popMatrix();
  pushMatrix();
  rotate(theta*2);
  translate(-15, 0);
  fill(0, 0, 200);
  ellipse(0, 0, 6, 6);
  popMatrix();
  popMatrix();
  
  theta += 0.01;
  
  
}
