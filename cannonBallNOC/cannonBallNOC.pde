// All of this stuff should go into a Cannon class
float angle = -PI/4;
PVector position = new PVector(50, 300);
boolean shot = false;
boolean once = false;
boolean localOnce = true;

CannonBall ball;

void setup() {
  size(640, 360);
  ball = new CannonBall(position.x, position.y);
}

void draw() {
  background(66); 

  pushMatrix();
  translate(position.x, position.y);
  rotate(angle);
  rect(0, -5, 50, 10);
  popMatrix();

  if (shot) {
    PVector gravity = new PVector(0, 0.2);
    ball.applyForce(gravity);
    ball.update();
  }
  ball.display();

  if (ball.position.y > height) {
    ball = new CannonBall(position.x, position.y);  
    shot = false;
    localOnce = true;
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    angle += 0.1;
  } 
  else if (key == CODED && keyCode == LEFT) {
    angle -= 0.1;
  } 
  else if (key == ' ') {
    shot = true;
    PVector force = PVector.fromAngle(angle);
    force.mult(10);
    //localOnce = true;
    once = true;
    if(once && localOnce) {
      ball.applyForce(force);
      once = false;
      localOnce = false;
    }
  }
}
