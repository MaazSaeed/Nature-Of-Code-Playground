String globalState = "circle";
int rows = 3;
int cols = 3;

Cell[][] cells;

void setup() {
  size(150, 150);
  cells = new Cell[rows][cols];
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      cells[i][j] = new Cell(j*50, i*50);
    }
  } 
}

void draw() {
  background(255);  
  for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      cells[i][j].display();
    }
  }   
  if(loopStates("row", 0) || loopStates("row", 1) || loopStates("row", 2) || loopStates("col", 0) || loopStates("col", 1) || loopStates("col", 2) || loopDiag("diag") 
  || loopDiag("diag2")) {
    noLoop();
  }
}

void mousePressed() {
for(int i = 0; i < rows; i++) {
    for(int j = 0; j < cols; j++) {
      if(cells[i][j].isMouseInside(mouseX, mouseY) && cells[i][j].getUsable()) {
        cells[i][j].setDrawState(globalState);
        cells[i][j].setUsable(false);
        if(globalState.equals("tic")) {
          globalState = "circle";
        } else if(globalState.equals("circle")) {
          globalState = "tic";
        }
      }
    }
  } 
}

boolean loopStates(String loop_, int row_col) {
  if(loop_.equals("row")) {
    if(cells[row_col][0].getDrawState().equals("circle") && cells[row_col][1].getDrawState().equals("circle") && cells[row_col][2].getDrawState().equals("circle")) {
      return true;
    } else if(cells[row_col][0].getDrawState().equals("tic") && cells[row_col][1].getDrawState().equals("tic") && cells[row_col][2].getDrawState().equals("tic")) {
      return true;
    } else {
      return false;
    }  
  } else if(loop_.equals("col")) {
      if(cells[0][row_col].getDrawState().equals("circle") && cells[1][row_col].getDrawState().equals("circle") && cells[2][row_col].getDrawState().equals("circle")) {
        return true;
  }   else if (cells[0][row_col].getDrawState().equals("tic") && cells[1][row_col].getDrawState().equals("tic") && cells[2][row_col].getDrawState().equals("tic")) {
        return true; 
  } else {
    return false;
  }
  } else {
    return false;
  }
}

boolean loopDiag(String traverse_) {
  if(traverse_.equals("diag")) {
    if(cells[0][0].getDrawState().equals("circle") && cells[1][1].getDrawState().equals("circle") && cells[2][2].getDrawState().equals("circle")) {
      return true;
    } else if(cells[0][0].getDrawState().equals("tic") && cells[1][1].getDrawState().equals("tic") && cells[2][2].getDrawState().equals("tic")) {
      return true;
    } else {
      return false;
    }
  } else if(traverse_.equals("diag2")) {
    if(cells[2][0].getDrawState().equals("circle") && cells[1][1].getDrawState().equals("circle") && cells[0][2].getDrawState().equals("circle")) {
      return true;
    } else if(cells[2][0].getDrawState().equals("tic") && cells[1][1].getDrawState().equals("tic") && cells[0][2].getDrawState().equals("tic")) {
      return true;
    } else {
      return false;
    }    
  } else {
    return false;
  }   
}