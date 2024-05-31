import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import java.util.*;

Box2DProcessing box2d;
Boundary b;
ArrayList<Clover> clovers;

void setup() {
  size(600, 400);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  clovers = new ArrayList<Clover>();
  b = new Boundary(width/2, height * 0.9, width, 10, 0);
}

void draw() {
  background(255);

  box2d.step();
  b.display();
  Iterator<Clover> it = clovers.iterator();
  
  while(it.hasNext()) {
    Clover c = it.next();
    c.display();
  }  
}

void mousePressed() {
  clovers.add(new Clover(mouseX, mouseY));
}
