class LightCell {

  boolean lit = false;
  PVector location = new PVector();
  float alpha = 1;

  LightCell() {
  }

  void on() {

    lit = true;
  }
}

class Lighting {

  int zoomStart = width;
  int zoomInRadius = zoomStart;
  int pixelSize = 20;
  Actor target;

  int cellSize = 10;
  int widthInCells = width / cellSize;
  int heightInCells = height / cellSize;
  LightCell cells[][] = new LightCell[widthInCells][heightInCells];
  PVector zoomInLocation;

  Lighting(Actor target) {
    this.target = target;

    for (int i = 0; i < widthInCells; i++) {

      for (int j = 0; j < heightInCells; j++) {

        cells[i][j] = new LightCell();
      }
    }

    println(widthInCells);
    println(heightInCells);
  }

  void update() {

    for (LightCell[] row : cells) {

      for (int j = 0; i < heightInCells; j++) {

        fill(0);
        //print("[" + i + "," + j + "]");
        try {
          if (cells[i][j].lit) rect(i * cellSize, j * cellSize, pixelSize, pixelSize);
        } catch (Exception e) {
          break;
        }
      }
    }

    zoomInLocation = new PVector(target.x, target.y);

    //if (zoomInRadius == zoomStart / 2) pixelSize *= .5;

    if (zoomInRadius > 200) zoomInRadius -= pixelSize;
  }

  void draw() {
  }
}
