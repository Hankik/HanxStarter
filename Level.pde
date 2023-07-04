class Level {

  // fields
  int playerAmount = 1;
  Player player = new Player(width*.5, height*.5);
  Controller c = new Controller(1, player);
  ActorPool actors = new ActorPool();
  View view = new View(c.pawn);
  Actor test = new Actor();

  Level() {
    
    test.x = 300;
    test.y = 300;
    test.setSize(30,30);
    test.addComponent( new Movement(test) );
    
    actors
      .addActor(c)
      .addActor(player)
      .addActor(view)
      .addActor(test); 
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
