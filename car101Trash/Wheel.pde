class Wheel {
  Body body;
  
  float r = 8; 

  Wheel(float x, float y, Frame f, String wheel) {
    
    float offsetX = f.w/2;
    float offsetY = f.h/2;
    
    if(wheel == "LEFT") {
      offsetX *= -1;
    } else if( wheel == "RIGHT") {
      offsetX *= 1;
    }
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x + offsetX, y + offsetY));
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.friction = 1;
    fd.density = 10;
    fd.restitution = 0;
    
    body = box2d.createBody(bd);
    body.createFixture(fd);    
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    strokeWeight(5);
    point(0, 0);
    strokeWeight(2);
    ellipse(0, 0, r * 2, r * 2);
    strokeWeight(1);
    line(0, 0, r, 0);
    //line(0, 0, r, r);
    line(0, 0, 0, r);
    //line(0, 0, -r, r);
    line(0, 0, -r, 0);
    //line(0, 0, -r, -r);
    line(0, 0, 0, -r);
   // line(0, 0, r, -r);
    popMatrix();
  }
}
