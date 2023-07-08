class Menu {

  // fields
  ActorPool uiActors = new ActorPool();
  
  Menu(){
    uiActors
      .addActor( new Button(width*.5, height*.25, 80, 40, "BUTTON", new ActionDamage(levels[currentLevel].player, 2)) );
  }
  
  void update(){
  
    if (isPaused){
      uiActors.update();
      uiActors.draw();
    }
  }
  
  void mousePressed(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mousePressed();
  }
  
  void mouseReleased(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mouseReleased();
  }
}
