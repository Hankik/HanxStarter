// Components give their actors actions
abstract class Action implements Cloneable{

  // fields
  String name = "";

  abstract void execute();
  
  @Override
   Action clone() throws CloneNotSupportedException {
   return (Action) super.clone();
   }
}

class ActionMove extends Action {

  // fields
  Actor target;
  PVector direction;
  float speed;

  ActionMove(Actor actor, PVector d, float speed) {
    name = "move";
    target = actor;
    direction = d;
    this.speed = speed;
  }

  void execute() {

    target.x += direction.x * speed * dt;
    target.y += direction.y * speed * dt;
  }
}

class ActionDamage extends Action {

  // fields
  Actor target;
  float amount;


  ActionDamage(Actor target, float amount) {

    name = "damage";
    this.target = target;
    this.amount = amount;
  }

  void execute() {
    Combat recipientCombatComponent = (Combat) target.getComponent("combat");

    if (recipientCombatComponent == null) return;

    recipientCombatComponent.takeDamage(amount);
  }
}

class ActionSwitchPawn extends Action {

  //fields
  Controller controller;
  Actor newPawn;
  View view;

  ActionSwitchPawn(Controller controller, Actor newPawn, View view) {

    this.controller = controller;
    this.newPawn = newPawn;
    this.view = view;
  }

  void execute() {
    if (controller.pawn.getComponent("ai_movement") != null) controller.pawn.enableComponent("ai_movement");
    if (newPawn.getComponent("movement") == null) newPawn.addComponent(new Movement(newPawn));
    if (newPawn.getComponent("ai_movement") != null) newPawn.disableComponent("ai_movement");

    controller.setPawn(newPawn);
    view.setTarget(newPawn);
  }
}
