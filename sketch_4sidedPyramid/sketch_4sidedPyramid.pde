float theta;

void setup()
{
  size(600, 400, P3D);
}

void draw()
{
  background(255);
  theta += 0.01;
    translate(width/2, height/2, 0);
  rotateX(theta);
  rotateY(theta);
  //rotateX(map(mouseY, 0, width, 0, TWO_PI));
  //rotateY(map(mouseX, 0, height, 0, TWO_PI));

  drawPyramid(120);

}


void drawPyramid(int t)
{
  
  stroke(0);
  strokeWeight(2);
  
  beginShape(TRIANGLES);
  fill(255, 0, 0);
  vertex(0, -t, -t);
  vertex(t, t, -t);
  vertex(0, 0, t);
  
  fill(0, 255, 0);
  vertex(t, t, -t);
  vertex(-t, t, -t);
  vertex(0, 0, t);
  
  fill(0, 0, 255);
  vertex(-t, t, -t);
  vertex(0, -t, -t);
  vertex(0, 0, t);
  
  fill(255, 255, 0);
  vertex(0, -t, -t);
  vertex(t, t, -t);
  vertex(-t, t, -t);
  endShape();
  

}
