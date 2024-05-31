class Box {
  Body body;
  
  float x;
  float y;
  
  float w;
  float h;
  
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = random(10, 20);
    h = random(10, 25);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    bd.angle = random(TWO_PI);
    
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
    noStroke();
    fill(169);
    translate(pos.x, pos.y);
    rotate(-a);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
