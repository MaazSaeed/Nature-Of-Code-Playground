float theta;

void setup()
{
  size(800, 500, P3D);
  //translate(100, 100, 0);
}

void draw()
{
  background(255);
  theta += 0.01;
  translate(width/2, height/2, 0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(100);
  
}

void drawPyramid(int t)
{
  stroke(0);
  fill(150, 0, 0, 127);
  beginShape(TRIANGLES);
  vertex(-t, -t, -t);
  vertex(t, -t, -t);
  vertex(0, 0, t);
  
  fill(0, 150, 0, 127);
  vertex(t, -t, -t);
  vertex(t, t, -t);
  vertex(0, 0, t);
  
  fill(0, 0, 150, 127);
  vertex(t, t, -t);
  vertex(-t, t, -t);
  vertex(0, 0, t);
  
  fill(150, 0, 150, 127);
  vertex(-t, -t , -t);
  vertex(-t , t, -t);
  vertex(0, 0, t);
  
  endShape();
  
}
