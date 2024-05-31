float angle;
float aVel;
float x = 100;
float r = 10;
float aAcc = 0.001;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  rotate(angle);
  stroke(0);
  strokeWeight(2);
  line(-x, 0, x, 0);
  fill(100);
  ellipse(-x, 0, r*2, r*2);
  ellipse(x, 0, r*2, r*2);

  aVel += aAcc;
  angle += aVel;
 // println(angularVel);

}
