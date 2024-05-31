float theta = 0;
float r = 0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  //background(255);
  
  translate(width/2, height/2);
  //fill(100);
  //noStroke();
  float x = r * cos(theta);
  float y = r * sin(theta);
  point(x, y);
  point(x,y);

  
  theta += 0.1; 
  r += 0.2;
  

}
