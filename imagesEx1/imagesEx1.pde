PImage img0;
PImage img1;

void setup() {
  size(640, 360);
  img0 = loadImage("hit0.jpg");
  img1 = loadImage("hit1.jpg");
  img0.resize(640, 360);
}

void draw() {
  background(img0);
  tint(255, 255, 255);
  image(img1, 0, 0, 640, 324);
}