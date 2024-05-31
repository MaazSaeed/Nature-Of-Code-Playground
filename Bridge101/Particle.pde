class Particle {
  Body body;
  
  float x;
  float y;
  
  float r = 3;
  boolean fixed;
  
  Particle(float x_, float y_, boolean fixed_) {
    fixed = fixed_;
    x = x_;
    y = y_;
    
    BodyDef bd = new BodyDef();
    
    if(fixed) {
      bd.type = BodyType.STATIC;
    } else {
      bd.type = BodyType.DYNAMIC;
    }
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd); 
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2d.scalarPixelsToWorld(4), box2d.scalarPixelsToWorld(4));
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 3.0;
    fd.friction = 5.0;
    fd.restitution = 0.0;
    
    body.createFixture(fd);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    noStroke();
    fill(210, 105, 30);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    ellipse(0, 0, r * 2, r * 2);
    popMatrix();
  }  
}
