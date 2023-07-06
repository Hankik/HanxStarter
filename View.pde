// view acts like a camera into game environment
class View extends Actor {

  // fields
  Actor target;
  float tx, ty;
  boolean following = true;
  
  View(Actor target) {
  
    name = "view";
    
    visible = false;
    this.target = target;
    tx = target.x - width*.5;
    ty = target.y - height*.5;
    x = tx;
    y = ty;
  }
  
  void update(){
  
    if (!following) return;
    tx = target.x - width*.5;
    ty = target.y - height*.5;
    
    float dx = tx - x;
    float dy = ty - y;
    x += dx * .2;
    y += dy * .2;
    
    super.update();
  }
  
  void draw(){
  
    super.draw();
  }
  
  void setTarget(Actor target){
  
    this.target = target;
  }
  
  
}
