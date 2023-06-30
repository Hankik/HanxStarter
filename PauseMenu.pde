class PauseMenu {

  // fields
  ActorPool uiActors = new ActorPool();
  
  PauseMenu(){
  
    uiActors
      .addActor( new Button(width*.5, height*.25, 80, 40, "BUTTON") );
  }
  
  void update(){
  
    if (isPaused){
      uiActors.update();
      uiActors.draw();
    }
  }
}
