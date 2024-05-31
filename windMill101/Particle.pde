class Particle {
  
  Body body;
  
  float x;
  float y;
  
  float r = 6;
  
  Particle(float x_, float y_) {
    x = x_;
    y = y_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd); 
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.1;
    
    body.createFixture(fd);    
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    noStroke();
    fill(210, 105, 30);
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, r * 2, r * 2);
    popMatrix();
  }  
  
  boolean fellOff() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    if(pos.y > height - r*2) {
      return true;
    } else {
      return false;
    }
  } 
}
