class Particle {
 
  Body body;
  Vec2 bodyCenter;
  float r;
  
  Particle(float x, float y) {
    
    r = 5;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    body.createFixture(cs, 1.0);
  }
  
  void display() {
    Vec2 bdCenter = box2d.getBodyPixelCoord(body);
    stroke(0);
    fill(130);
    ellipse(bdCenter.x, bdCenter.y, r * 2, r * 2);
  }  
}
