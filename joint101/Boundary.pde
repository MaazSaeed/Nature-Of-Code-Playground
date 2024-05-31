class Boundary {
  
  Body body;
  float x;
  float y;
  
  float w;
  float h;
  
  float angle;
  
  Boundary(float x_, float y_, float w_, float h_) {
    w = w_;
    h = h_;
    x = x_;
    y = y_;
    
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    BodyDef bd;
    bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    body = box2d.createBody(bd);
    body.createFixture(fd);
  }  

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    stroke(0);
    translate(pos.x, pos.y);
    fill(28, 220, 98);
    rectMode(CENTER);
    rect(0, 0, w, h, 4); 
    popMatrix();
        
  }

 
}
