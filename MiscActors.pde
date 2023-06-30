class Cursor extends Actor {

  Cursor(){
  
    name = "cursor";
    x = 1000;
    y = 1000;
    //visible = false;
    setSize(24,24); // size of cursor hitbox
  }
  
  void update(){
    super.update();
    
    x = mouseX + levels[currentLevel].view.x;
    y = mouseY + levels[currentLevel].view.y;
  }
  
  void draw(){
    super.draw();
  }
}
