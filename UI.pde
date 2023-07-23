class UI {

  // fields
  ActorPool uiActors = new ActorPool();
  
  UI(){
    
  }
  
  void update(){
      uiActors.update();
      uiActors.draw();
  }
  
  void mousePressed(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mousePressed();
  }
  
  void mouseReleased(){
  
    for (HashMap.Entry<String, ArrayList<Actor>> entry : uiActors.pool.entrySet()) for (Actor a : entry.getValue()) a.mouseReleased();
  }
}
