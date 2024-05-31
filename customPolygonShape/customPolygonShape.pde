import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import java.util.*;

Box2DProcessing box2d;
ArrayList<Polygon> polygons ;
Boundary b;
Boundary b1;
Boundary b2;

void setup() {
  size(540, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -50);
  polygons = new ArrayList<Polygon>();  
  b = new Boundary(width-250, height/2, 230, 10, PI/8);
  b1 = new Boundary(150, height * 0.9, 300, 10, -PI/15);
  b2 = new Boundary(100, 100 , 150, 10, -PI/14);
}

void draw() {
  background(255);
  
  if(frameCount % 60 == 0) {
    polygons.add(new Polygon(random(width), random(-30, 10)));
  }
  
  box2d.step();
  b1.display();
  b2.display();
  b.display();
  
  Iterator<Polygon> it = polygons.iterator();

  while(it.hasNext()) {
    Polygon p = it.next();
    p.display();
    
    if(p.fellOff()) {
      p.destroyBody();
      it.remove();
    }
  }
}

void mousePressed() {
  polygons.add(new Polygon(mouseX, mouseY));
}
