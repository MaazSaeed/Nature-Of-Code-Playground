import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import java.util.*;

Box2DProcessing box2d;
ArrayList<Pair> pairs;
Boundary b;

void setup() {
  size(600, 350);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  pairs = new ArrayList<Pair>();
  b = new Boundary(width/2, height * 0.9, 300, 10);
}

void draw() {
  background(255);
  box2d.step();
  b.display();
  
 for(Pair p: pairs) {
   p.display();
 }
  
}

void mousePressed() {
  pairs.add(new Pair(mouseX, mouseY));
}
