class UI {

  // fields
  ActorPool uiActors = new ActorPool();
  final int MENU = 0;
  final int HUD = 1;
  
  UI(int id){
    switch (id) {
    
      case MENU:
      uiActors
        .addActor( new Button(width*.5, height*.25, 200, 40, "PUNCH YOURSELF", new ActionDamage(levels[currentLevel].player, 2)) );
      break;
      case HUD:
      uiActors
        .addActor( new Curve() );
      break;
    }
    
  }
  
  void update(){
      uiActors.update();
 
  }
  void draw() {
       uiActors.draw();
  }
  
  void mousePressed(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mousePressed();
  }
  
  void mouseReleased(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mouseReleased();
  }
}
