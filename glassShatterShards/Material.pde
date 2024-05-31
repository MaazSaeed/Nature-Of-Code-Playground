class Material {
  
  ArrayList<Shard> shards;
  ArrayList<PVector> locs;
  
  PVector location;
  boolean shatterBool;
  int w;
  int h;
  int globalSW;
  
  Material() {
    location = new PVector(50, 20);
    shatterBool = false;
    w = 300;
    h = 200;
    locs = new ArrayList<PVector>();
    shards = new ArrayList<Shard>();
  }
  
  void display() {
    if(shatterBool == false) {
      fill(100, 150);
      noStroke();
      rect(location.x, location.y, w, h);
    }
    else {
      if(shards != null) {
      for(int i = 0; i < shards.size(); i++) {
        Shard s = shards.get(i);
        s.run();
        
        if(s.isDead()) {
          shards.remove(i);
          locs.remove(i);  
          }
        }
      }
    }
    }
  
  
  void addShards() {
    if(shards != null) {
    for(int i = 0; i < locs.size(); i++) {
      PVector tempLoc = locs.get(i);
      shards.add(new Shard(tempLoc, globalSW, globalSW));
    }
    }
  }
  
  void shatter(PVector mouseLocation) {
    
    if(mouseLocation.x > location.x && mouseLocation.x < location.x + w && mouseLocation.y > location.y && mouseLocation.y < location.y + h) {

      shatterBool = true;
      int numberOfShardsPerBlock = 30;
      int sW = (int(location.x)+w)/numberOfShardsPerBlock;
      int sH = (int(location.y)+w)/numberOfShardsPerBlock;
      
      globalSW = sW;
      
      int i = int(location.x);
      while(i < (int(location.x) + w)) {
        int j = int(location.y);
        while(j < (location.y + h)) {
          locs.add(new PVector(i, j));
          j += sH;  
        }
        i += sW;
      }
    }    
  }
}
