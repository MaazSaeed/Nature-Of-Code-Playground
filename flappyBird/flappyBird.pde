PVector gravity = new PVector(0, 0.3);
ArrayList<Pipe> pipes;
Bird bird;
//boolean start = false;
boolean start = false;
float offset = -500;

void setup() {
  size(500, 450);
  smooth();
  pipes = new ArrayList<Pipe>();
  bird = new Bird();
}

void draw() {
  background(190, 252, 250);
  
  bird.display();
  
  if(!start) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("press space to play the game", width/2, height/2);
  }
    
  if(start) {  
      
    if(frameCount % 120 == 0) {
      pipes.add(new Pipe());
    }
    bird.applyGravity(gravity);
    bird.update();
    for(int i = 0; i < pipes.size(); i++) {
      Pipe p = pipes.get(i);
      p.display();
      p.scroll();
      if(p.getX() < offset) {
        pipes.remove(p);
      }
      if(p.collide(bird) || bird.getY() >= 425 ) {
       for(int j = 0; j < pipes.size(); j++) {
          pipes.remove(j);
        }
        start = false;
        bird.setY(100);

      } 
  }


  
  
}          
  ////println(pipes.size());
  //println(bird.acceleration);
  stroke(0);
  strokeWeight(3);
  fill(151, 113, 10);
  rect(-1, 440, width+1, 60, 5);
}

void keyReleased() {
  if(key == ' ') {
    bird.applyForce(bird.getThrust());
    bird.theta -= 0.5;
  }
}

void keyPressed() {
  if(key == ' ') {
    start = true;
  }
}
