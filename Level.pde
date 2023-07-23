class Level {

  // fields
  int playerAmount = 1;
  Player player = new Player(width*.5, height*.5);
  Controller c = new Controller(1, player);
  ActorPool actors = new ActorPool();
  View view = new View(c.pawn);
  Actor test = new Actor();
  PVector location = null;

  Level() {

    test.x = 0;
    test.y = 0;
    test.setSize(30, 30);
    test.addComponent( new AIMovement(test) );
    test.addComponent( new MouseDraggable(test));
    ((MouseDraggable) test.getComponent("mouse_draggable")).isUI = false;
    AIMovement ai = (AIMovement) test.getComponent("ai_movement");
    ai.setTarget(player);

    actors
      .addActor(c)
      .addActor(player)
      .addActor(view)
      .addActor(test);
  }

  void update() {

    
    actors.update();
  }
  void draw() {

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
