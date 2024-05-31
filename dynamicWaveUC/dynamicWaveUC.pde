float startAngle = 0;
float angleVel = 0.1;

void setup() {
  size(600, 200);
}

void draw() {
  background(255);
  
  float angle = startAngle;
  
  for(int x = 0; x <= width; x+=12) {
    float y = map(sin(angle), -1, 1, 0, height);
    stroke(0);
    fill(0, 50);
    ellipse(x, y, 20, 20);
    angle += angleVel;
  }
}
