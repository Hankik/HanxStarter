class Player extends Actor {

  // fields
  Movement movement = new Movement(this);
  Combat combat = new Combat(this);
  
  // animations
  Animation walk = new Animation(this, roboWalk);
  Animation idle = new Animation(this, roboIdles);
  Animation[] animations = {walk, idle};
  final int IDLE = 1;
  final int WALK = 0;
  int currentAnim = WALK;

  Player(float xPos, float yPos) {
    name = "player";

    this
      .addComponent(movement)
      .addComponent(combat);

    concerns.add("button");

    x = xPos;
    y = yPos;
    movement.speed = 100;
  }

  void update() {
    animations[currentAnim].update();
    super.update();
    
    if (movement.direction.x < 0) walk.flipped = true;
    if (movement.direction.x > 0) walk.flipped = false;
    if (!movement.isMoving || !keyPressed) currentAnim = IDLE;
    else currentAnim = WALK;
  }

  void draw() {
    super.draw();
    
    animations[currentAnim].draw();
  }

  @Override
    void handleConcern(Actor concern) {

    switch (concern.name) {
    case "button":
      if (checkCollision(concern)) return;
      stroke = RED;
      break;
    }
  }

  @Override
    void handleConcernCollision(Actor concern) {

    switch (concern.name) {
    case "button":
      stroke = WHITE;
      break;
    }
  }

  @Override
    void kill() {

    isDead = true;
  }
}
