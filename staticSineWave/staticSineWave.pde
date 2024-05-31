float angle = 0;
float aVel = 0.2;


void setup() {
  size(400, 200);
  background(255);
  noFill();
  beginShape();
  for(int x = 0; x <= width; x+=5) {
    float y = map(sin(angle), -1, 1, 0, height);
    vertex(x, y);
    angle += aVel;
  }
  endShape();
}
