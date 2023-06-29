class Player extends Actor {

  // fields
  Movement movement = new Movement(this);
  Combat combat = new Combat(this);

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
    super.update();
  }

  void draw() {
    super.draw();
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
