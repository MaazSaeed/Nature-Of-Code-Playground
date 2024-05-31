int rows = 6;
int cols = 7;

Cell[][] cells;
String globalState = "circle";

void setup() {
  size(700, 600);
  cells = new Cell[rows][cols];

  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      cells[y][x] = new Cell(x*100, y*100);

      if (y == 5) {
        cells[y][x].setUsable("usable");
        //println(cells[y][x].getUsable());
      }
    }
  }
}

void draw() {
  background(255);  
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      cells[y][x].display();
      //fill(0);
      //textSize(10);
      //textAlign(CENTER);
      //text(cells[y][x].getUsable(), cells[y][x].getX(), cells[y][x].getY()+10);
    }
  }
}

void mousePressed() { 
  for (int x = 0; x < cols; x++) {
    if (isMouseInside(mouseX, cells[0][x].getX())) {
      traverseCells(x);
    }
  }
}

void traverseCells(int col_) {    
  for (int y = 0; y < rows; y++) {
    if (cells[y][col_].getUsable().equals("usable")) {
      cells[y][col_].setUsable("");
      cells[y][col_].setDrawState(globalState);

      if (globalState.equals("rect")) {
        globalState = "circle";
      } else if (globalState.equals("circle")) {
        globalState = "rect";
      }

      if (y != 0) {
        cells[y-1][col_].setUsable("usable");
      }
    }
  }
}

boolean isMouseInside(float mx, float x) {
  if (mx > x && mx < (x+100)) {
    return true;
  } else {
    return false;
  }
}