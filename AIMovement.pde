class AIMovement extends Movement {

  // fields
  Actor target;
  
  
  AIMovement(Actor parent){
    super(parent);
    name = "ai_movement";
     
  }
  
  void update(){
  
    if (target == null) return;
    
    PVector targetLocation = new PVector();
    targetLocation.x = target.x - parent.x;
    targetLocation.y = target.y - parent.y;
    targetLocation.normalize();
   
    
    move(
          targetLocation
        );
    if ( dist(target.x, target.y, parent.x, parent.y) < .01 ) target = null;
    
  }
  
  void draw(){}
  
  void setTarget(Actor target){
  
    this.target = target;
  }
  
}
