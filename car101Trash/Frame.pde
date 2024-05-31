class Frame{
  Body body;
  
  float w;
  float h;
  
  Frame(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.angle = 0;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    
    body = box2d.createBody(bd);
    body.createFixture(ps, 100);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    stroke(0);
    strokeWeight(1);
    noFill();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    rect(0, 0, w, h, 6);
    popMatrix();
  }
}
