class Lighting {

  int zoomStart = width;
  int zoomInRadius = zoomStart;
  int pixelSize = 80;
  Actor target;
  PVector zoomInLocation;

  Lighting(Actor target) {
    this.target = target;
  }

  void update() {

    zoomInLocation = new PVector(target.x, target.y);

    if (zoomInRadius == zoomStart / 2) pixelSize *= .5;
    

    for (int i = 0; i < width; i+=pixelSize) {
      for (int j = 0; j < height; j+=pixelSize) {

        if ( dist(i, j, zoomInLocation.x, zoomInLocation.y) > zoomInRadius) {

          fill(0);
          rect(i, j, pixelSize, pixelSize);
        }
      }
    }
    
    if (zoomInRadius > 200) zoomInRadius -= pixelSize;
  }

  void draw() {
  }
}
