import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;
//Vec2 center = new Vec2(width/2, height/2); .......Nah nanh box2d is not familiar without processing world
Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);
BodyDef bd = new BodyDef();
Body body;
FixtureDef fd;
PolygonShape ps;

float box2Dw = box2d.scalarPixelsToWorld(150);
float box2Dh = box2d.scalarPixelsToWorld(100);


void setup() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  fd = new FixtureDef();
  ps = new PolygonShape();
  bd.position.set(center);
  body = box2d.createBody(bd);
  body.setLinearVelocity(new Vec2(0, 2));
  ps.setAsBox(box2Dw, box2Dh);
  fd.shape = ps;
  
  fd.friction = 0.3;
  fd.restitution = 0.5;
  fd.density = 1.0;
  body.createFixture(ps, 1);
  body.display();
}
