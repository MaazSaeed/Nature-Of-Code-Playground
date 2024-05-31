Mover m;


void setup() {
  size(500, 460);
  m = new Mover(3, 10, 10);
}

void draw() {
  background(255);


  if(mousePressed) {
    PVector mouseLoc = new PVector(mouseX, mouseY);
    PVector objectLoc = m.location;
    PVector dir = PVector.sub(mouseLoc, objectLoc);
    
    dir.normalize();
    if(dir.y != 0){
      dir.y /= abs(dir.y);
    }
    if(dir.x != 0) {
      dir.x /= abs(dir.x);
    }
    //dir.y *= 2;
    //dir.x *= 1;
        println(dir);
    
    m.applyForce(dir);
  }
  
  PVector gravity = new PVector(0, 0.1 * m.mass);
  m.applyForce(gravity);
  
  m.display();
  m.update();
  m.checkEdges();
  
}
