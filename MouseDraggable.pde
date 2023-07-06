class MouseDraggable extends Component {
  
  // fields

  MouseDraggable(Actor parent){
  
    this.parent = parent;
    
    name = "mouse_draggable";
  }
  
  void update(){
  
    if (mousePressed && parent.checkCollision(cursor)) {
    
      //if ( !cursor.draggingTarget.equals(this) ) return;
      parent.x = cursor.x;
      parent.y = cursor.y;
    }
  }
  
  void draw(){}
}
