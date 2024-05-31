int rows = 4;
int cols = 5;
float grid = 100;

Cell[][] cells;
String[][] imgNames;

String a = "x";
String b = "y";

void setup() { 
  size(500, 400);
  imgNames = new String[rows][cols];
  cells = new Cell[rows][cols];
  
  int index = 0;
  for(int y = 0; y < rows; y++) {
    for(int x = 0; x < cols; x++) {
      imgNames[y][x] = "hit" + index + ".jpg";
      index++;
      if(index > 9) {
        index = 0;
      }
    }
  }
    
  for(int y = 0; y < rows; y++) {
    for(int x = 0; x < cols; x++) {
      cells[y][x] = new Cell(x*grid, y*grid, imgNames[y][x]);
    }
  }  
}

void draw() {
  background(255);     
  for(int y = 0; y < rows; y++) {
    for(int x = 0; x < cols; x++) {
        cells[y][x].display();
        if(cells[y][x].timer.isFinished()) {
          cells[y][x].setShowState(false);
          a = "x";
          b = "y";
        }      
        
        if(cells[y][x].getShowState() && a.equals(b)) {
          cells[y][x].setTunedState(true);
        }
    }
  }
  
  println(a);
    
}

void mousePressed() {
  for(int y = 0; y < rows; y++) {
    for(int x = 0; x < cols; x++) {
      if(cells[y][x].isMouseInside(mouseX, mouseY) && (cells[y][x].getShowState() == false)) {
        cells[y][x].setShowState(true);
        cells[y][x].timer.startTimer();
      }
    }
  }  
}