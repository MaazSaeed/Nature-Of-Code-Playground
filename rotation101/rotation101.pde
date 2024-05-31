float theta1 = 0;
float theta2 = 0;

void setup()
{
  size(200, 200, P3D);
}

void draw()
{
  background(255);
  
  pushMatrix(); // store grid's initial origin
  translate(50, 50);
  rotate(theta1);
  rectMode(CENTER);
  noStroke();
  fill(150);
  rect(0, 0, 40, 40);
  popMatrix();
  
  translate(100, 100);
  rotate(theta2);
  rect(0, 0, 30, 30);
  
  theta1 += 0.03;
  theta2 += 0.03;
}
