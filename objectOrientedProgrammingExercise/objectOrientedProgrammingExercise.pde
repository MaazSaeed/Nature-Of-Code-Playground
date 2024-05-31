//Square s;
//Circle c;
////Line l;
Shape[] shapes = new Shape[23];


void setup() {
  size(300, 300);
  // non polymorphism way..
  //s = new Square(150, 100, 50, color(100, 200, 100));
  //c = new Circle(250, 150, 50, color(100, 200, 100));
  //l = new Line(0, 200, 3, 400, 200);
  
  for(int i = 0; i < shapes.length; i++) {
    if(i < 10) {
      shapes[i] = new Circle(i*10 + 30, 100, 50, color(100, 200, 100));
    } else if(i < 20){
      shapes[i] = new Square(i*10 + 30, 200, 50, color(100, 200, 100)); 
    } else {
      shapes[i] = new Line(random(i), random(i)+20, random(1, 4), random(width-i), random(i));    
    }
  } 
  
}

void draw() {
  background(255);
  //s.display();
  //s.jiggle();
  //c.display();
  //c.jiggle();
  //c.changeColor();
  //l.display();
  //l.jiggle();
  for(int i = 0; i < shapes.length; i++) {
    shapes[i].display();
    shapes[i].jiggle();
    shapes[i].changeColor();
  }
}