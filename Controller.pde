// suppose you want to have your user swap which actor they are controlling
// if you handle user inputs through the controller,
// you can change which ACTOR the controller has accessed by changing the current PAWN variable

// to allow the user to swap pawn with any given actor, perform changes to it through its components

class Controller extends Actor {

  // fields
  Actor pawn;
  Movement movement;
  int id;

  Controller(int id, Actor pawn) {
    name = "controller";

    this.id = id;
    setPawn(pawn);
  }

  void update() {
    super.update();

    if (movement != null && keyPressed) {

      movement.move(
        Keyboard.isDown(Keyboard.LEFT),
        Keyboard.isDown(Keyboard.RIGHT),
        Keyboard.isDown(Keyboard.UP),
        Keyboard.isDown(Keyboard.DOWN)
        );
    }
  }

  void setPawn(Actor pawn) {

    if (this.pawn instanceof Player) {

      ((Player) this.pawn).controller = null;
    }
    if (pawn instanceof Player) {

      ((Player) pawn).controller = this;
    }

    this.pawn = pawn;
    movement = (Movement) pawn.getComponent("movement");
  }

  void draw() {
  }

  void keyPressed() {
    if (key == TAB) {

      if (pawn == levels[currentLevel].test) {
        
        addAction(
          new ActionSwitchPawn(
            this,
            levels[currentLevel].player,
            levels[currentLevel].view
          ));
      } else {
        
        addAction(
          new ActionSwitchPawn(
            this,
            levels[currentLevel].test,
            levels[currentLevel].view
          ));
      }
    }
  }

  void keyReleased() {
  }

  void mousePressed() {
  }

  void mouseReleased() {
  }
}
