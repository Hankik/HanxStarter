class Curve extends Actor {
  
  // fields
  Timer clock = new Timer(3);
  Actor pointA = new Actor(200, 200);
  Actor pointB = new Actor(400, 200);
  Actor pointC = new Actor(400, 400);
  Actor pointD = new Actor(200, 400);
  PVector lerpAB = new PVector();
  PVector lerpBC = new PVector();
  ArrayList<PVector> points = new ArrayList();

  Curve(){
    
    pointA.addComponent( new MouseDraggable(pointA) );
    pointB.addComponent( new MouseDraggable(pointB) );
    pointC.addComponent( new MouseDraggable(pointC) );
  }
  
  void update(){
  
    super.update();
    
    pointA.update();
    pointB.update();
    pointC.update();
    
    clock.update();
    if (clock.isDone) {
    
      clock.reset();
      points.clear();
    }
    
    float t = (clock.duration - clock.timeLeft) / clock.duration;
    
    lerpAB.x = lerp(pointA.x, pointB.x, t);
    lerpAB.y = lerp(pointA.y, pointB.y, t);
    lerpBC.x = lerp(pointB.x, pointC.x, t);
    lerpBC.y = lerp(pointB.y, pointC.y, t);  
    
    PVector point = new PVector();
    point.x = lerp(lerpAB.x, lerpBC.x, t);
    point.y = lerp(lerpAB.y, lerpBC.y, t);
    points.add( point );
    fill(RED);
    
    
    
  }
  
  void draw(){
    pointA.draw();
    pointB.draw();
    pointC.draw();
  
    stroke(BLUE);
    strokeWeight(4);
    line(pointA.x, pointA.y, pointB.x, pointB.y);
    line(pointB.x, pointB.y, pointC.x, pointC.y);
    line(lerpAB.x, lerpAB.y, lerpBC.x, lerpBC.y);
    
    stroke(RED);
    for (PVector p : points) point(p.x, p.y);
  }
}
