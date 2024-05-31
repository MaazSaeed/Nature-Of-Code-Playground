PVector gravity = new PVector(0, 0.2);

Bird bird;
//Pipe pipe;
Pipe[] pipes;

void setup() {
  size(600, 400);
  bird = new Bird();
  //pipe = new Pipe();
  pipes = new Pipe[1];
  pipes[0] = new Pipe();
}

void draw() {
  background(255);
  bird.drawBird();
  bird.applyGravity(gravity);
  bird.updateVectors();
  
  for(int i = 0; i < pipes.length; i++) {
    pipes[i].drawPipe();
    pipes[i].scrollPipe(); 
}
    
    
  if(frameCount % 120 == 0) {
    Pipe x = new Pipe();
    pipes = (Pipe[]) append(pipes, x);
  }
  
}

void keyPressed() {
  if(keyCode == ' ') {
    bird.moveUp();
  }
}