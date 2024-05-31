class Box {
  
  Body body;
  
  float x;
  float y;
  
  float w;
  float h;
  boolean fixed;
  
  Box(float x_, float y_, float w_, float h_, boolean fixed_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    fixed = fixed_;

    
    BodyDef bd = new BodyDef();
    if(fixed) {
      bd.type = BodyType.STATIC;
    } else {
      bd.type = BodyType.DYNAMIC;
    }
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    bd.angle = 0;
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2Dw, box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = 0.8;
    fd.restitution = 0;
    
    body = box2d.createBody(bd);
    body.createFixture(fd);   
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body); 
    float a = body.getAngle();
    
    pushMatrix();
    stroke(0);
    fill(169);
    translate(pos.x, pos.y);
    rotate(-a);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  } 
}
