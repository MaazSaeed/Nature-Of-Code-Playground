import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Border boundary;
Border border;

Vehicle vehicle;
Surface s;

void setup() {
  size(640, 200);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -40);
  boundary = new Border(width/2, height, width, 20);
  border = new Border(0, height/2, 20, height);
  vehicle = new Vehicle(60, -10);
  s = new Surface();
}

void draw() {
  
  background(255);
  box2d.step();
  boundary.display();
  vehicle.display();
  border.display();
  s.display();
  //fill(0);
  //textSize(13);
  //text("click to reset car location", 40, height * 0.9);
    
  if(box2d.vectorWorldToPixels(vehicle.frame.body.getWorldCenter()).y > height) {
    vehicle = new Vehicle(random(width * 0.1, width * 0.2), -10);
  }
}
