int[] numbers = {2, 1, 3, 4, 5, 6 ,7, 8, 9};
float x = 0;

void setup() {
  size(200, 50);
}

void draw() {
  background(255);
  fill(0);
  textSize(20);
  for(int i = 0; i < numbers.length; i++) {
    text(numbers[i], i*20 + 10, 30);
    }
  
    if(win()) {
      println("numbers arranged");
      noLoop();
    }
}   

void keyPressed() {
  if(keyCode == '2') {
    swap(2);
  }
  if(keyCode == '3') {
    swap(3);
  }
  if(keyCode == '4') {
    swap(4);
  }
  if(keyCode == '5') {
    swap(5);
  }
  if(keyCode == '6') {
    swap(6);
  }
  if(keyCode == '7') {
    swap(7);
  }
  if(keyCode == '8') {
    swap(8);
  }
  if(keyCode == '9') {
    swap(9);
  }  
}

void swap(int key_) {
  int counterX = ((key_) - 1);
  int counter = 0;
  
  if(key_ == 2 || key_ == 3) {
    counter = 1;
  } else if(key_ == 4 || key_ == 5) {
    counter = 2;
  } else if(key_ == 6 || key_ == 7) {
    counter = 3;
  } else if(key_ == 7 || key_ == 8) {
    counter = 4;
  } else if(key_ == 9) {
    counter = 5;
  }
  
  for(int i = 0; i < counter; i++) {
    int copy = numbers[i];
    numbers[i] = numbers[counterX-i];
    numbers[counterX-i] = copy;
  }  
}

boolean win() {
  if(numbers[0] == 1 && numbers[1] == 2 && numbers[2] == 3 && numbers[3] == 4 && numbers[4] == 5 && numbers[5] == 6 && numbers[6] == 7 && numbers[7] == 8
  && numbers[8] == 9) {
    return true;
  } else {
    return false;
  }
}