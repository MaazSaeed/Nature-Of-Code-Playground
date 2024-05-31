float angle = 0;
Mover m;
void setup() {
  size(640, 360);
  m = new Mover();
}

void draw() {
  background(255);
  m.display();
  m.checkEdges();
  m.update();
}

void keyPressed() {

  if(key == CODED && keyCode == RIGHT) {
    angle += 0.2;
  }
  if(key == CODED && keyCode == LEFT) {
    angle -= 0.2;
  }
  
  if(key == CODED && keyCode == UP) {
    PVector thrust = new PVector(sin(angle), -cos(angle));
    thrust.normalize();
    thrust.mult(30);
    m.applyForce(thrust);
  }
}
