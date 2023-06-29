class Movement extends Component {
  
  // fields 
  Actor parent;
  float speed = 30;
  PVector direction;
  boolean isMoving = false;
  boolean enabled = true;

  Movement(Actor parent){
  
    name = "movement";
    this.parent = parent;
    direction = new PVector();
  }
  
  void update(){}
  
  void draw(){}
  
  void move(boolean moveLeft, boolean moveRight, boolean moveUp, boolean moveDown){
    
    if (!enabled) return;
    isMoving = moveLeft || moveRight || moveUp || moveDown;
    if (!isMoving) return;
    
    direction.mult(0);
    
    if (moveLeft && !moveRight) direction.x -= 1;
    if (!moveLeft && moveRight) direction.x += 1;
    if (moveUp && !moveDown) direction.y -= 1;
    if (!moveUp && moveDown) direction.y += 1;
    
    direction.normalize();
    
    parent.actions.add( new ActionMove(parent, direction, speed) );
  }
}
