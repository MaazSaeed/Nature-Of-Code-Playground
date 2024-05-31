class Box {
 // PVector location;
 // PVector velocity;
 // PVector acceleration;
  
  Body body;
  
  float x;
  float y;
  
  float w;
  float h;
  
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = 20;
    h = 20;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_, y_));
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2Dw, box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 1;
    fd.friction = 0.4;
    fd.restitution = 0.1;
    
    body = box2d.createBody(bd);
    body.createFixture(fd);
    
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    noStroke();
    //strokeWeight(1);
    fill(130);
    translate(pos.x, pos.y);
    rotate(-a);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
   
  void destroyBody() {
    box2d.destroyBody(body);
  }
  
  boolean fellOff() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    if(pos.y > height+w*h) {
      return true;
    } else {
      return false;
    }
  }
  
}
