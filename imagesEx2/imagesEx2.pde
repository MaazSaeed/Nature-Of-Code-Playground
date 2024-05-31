PImage[] images;
int globalIndex = 0;

void setup() {
  size(700, 500);
  images = new PImage[5];
  int index = 0;
  for(int i = 0; i < images.length; i++) {
    images[i] = loadImage("hit" + index + ".jpg");
    images[i].resize(700, 500);
    index++;
  }
}
void draw() {
  background(images[globalIndex]);
  println(globalIndex);
}
void mousePressed() {
  globalIndex = (globalIndex + 1) % images.length;
}