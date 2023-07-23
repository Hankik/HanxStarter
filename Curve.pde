class Curve extends Actor {
  
  // fields
  Timer clock = new Timer(3);
  Actor pointA = new Actor(200, 200);
  Actor pointB = new Actor(400, 200);
  Actor pointC = new Actor(400, 400);
  Actor pointD = new Actor(200, 400);
  PVector lerpAB = new PVector();
  PVector lerpBC = new PVector();
  PVector lerpCD = new PVector();
  PVector lerp2ABC = new PVector();
  PVector lerp2BCD = new PVector();
  ArrayList<PVector> points = new ArrayList();
  
  boolean editable = true;

  Curve(){
    
    pointA
      .addComponent( new MouseDraggable(pointA) );//.addComponent(new BoundingBox(pointA, 180, 180, 420, 420));
    pointB
      .addComponent( new MouseDraggable(pointB) );// .addComponent(new BoundingBox(pointB, 180, 180, 420, 420));
    pointC
      .addComponent( new MouseDraggable(pointC) );//.addComponent(new BoundingBox(pointC, 180, 180, 420, 420));
    pointD
      .addComponent( new MouseDraggable(pointD) );//.addComponent( new BoundingBox( pointD, 180, 180, 420, 420));
  }
  
  void update(){
  
    super.update();
    
    pointA.update();
    pointB.update();
    pointC.update();
    pointD.update();
    
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
    lerpCD.x = lerp(pointC.x, pointD.x, t);
    lerpCD.y = lerp(pointC.y, pointD.y, t);
    lerp2ABC.x = lerp(lerpAB.x, lerpBC.x, t);
    lerp2ABC.y = lerp(lerpAB.y, lerpBC.y, t);
    lerp2BCD.x = lerp(lerpBC.x, lerpCD.x, t);
    lerp2BCD.y = lerp(lerpBC.y, lerpCD.y, t);
    
    
    PVector point = new PVector();
    point.x = lerp(lerp2ABC.x, lerp2BCD.x, t);
    point.y = lerp(lerp2ABC.y, lerp2BCD.y, t);
    points.add( point );
    fill(RED);
    
    
    
  }
  
  void draw(){
    
    if (!editable) return;
    
    pointA.draw();
    pointB.draw();
    pointC.draw();
    pointD.draw();
  
    stroke(BLUE);
    strokeWeight(4);
    line(pointA.x, pointA.y, pointB.x, pointB.y);
    line(pointB.x, pointB.y, pointC.x, pointC.y);
    line(pointC.x, pointC.y, pointD.x, pointD.y);
    stroke(GREEN);
    line(lerpAB.x, lerpAB.y, lerpBC.x, lerpBC.y);
    line(lerpBC.x, lerpBC.y, lerpCD.x, lerpCD.y);
    stroke(YELLOW);
    line(lerp2ABC.x, lerp2ABC.y, lerp2BCD.x, lerp2BCD.y);
    
    stroke(RED);
    for (PVector p : points) point(p.x, p.y);
  }
  
  void toggleEditable(){
  
    if (editable) {
    
      editable = false;
      disableComponent("mouse_draggable");
    } else {
    
      editable = true;
      enableComponent("mouse_draggable");
    }
  }
}
