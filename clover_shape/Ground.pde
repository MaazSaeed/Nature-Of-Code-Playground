class Boundary {
  
  Body body;
  float w;
  float h;
  float angle;
  
  Boundary(float x_, float y_, float w_, float h_, float angle_) {
    
    w = w_;
    h = h_;
    angle = angle_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    bd.angle = angle;
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    
    body.createFixture(fd);
  }
  
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    float angle = body.getAngle();
    
    noStroke();
    fill(50);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  
  }
}
