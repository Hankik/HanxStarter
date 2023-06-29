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

    this.id = id;
    this.pawn = pawn;
    
    movement = (Movement) pawn.getComponent("movement");
  }
  
  void update(){
    
    if (movement != null && keyPressed) {
    
      movement.move(
                Keyboard.isDown(Keyboard.LEFT),
                Keyboard.isDown(Keyboard.RIGHT),
                Keyboard.isDown(Keyboard.UP),
                Keyboard.isDown(Keyboard.DOWN)
                );
    }
    
  }
  
  void setPawn(Actor pawn){
  
    this.pawn = pawn;
    movement = (Movement) pawn.getComponent("movement");
  }
  
  void draw(){}

  void keyPressed() {
  }

  void keyReleased() {
  }

  void mousePressed() {
  }

  void mouseReleased() {
  }
}
