class Level {

  // fields
  int playerAmount = 1;
  Player player = new Player(width*.5, height*.5);
  Controller c = new Controller(1, player);
  ActorPool actors = new ActorPool();
  View view = new View(c.pawn);

  Level() {
    
    actors
      .addActor(c)
      .addActor(player)
      .addActor(view);
  }

  void update(){
    actors.update();
  }
  void draw(){
  
    actors.draw();
  }

  void keyPressed() {
    c.keyPressed();
  }

  void keyReleased() {
    c.keyReleased();
  }

  void mousePressed() {
    c.mousePressed();
  }

  void mouseReleased() {
    c.mouseReleased();
  }
}
