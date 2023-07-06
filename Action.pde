// Components give their actors actions
abstract class Action {

  // fields
  String name = "";
}

class ActionMove extends Action {

  ActionMove(Actor actor, PVector d, float speed) {
    name = "move";
    actor.x += d.x * speed * dt;
    actor.y += d.y * speed * dt;
  }
}

class ActionDamage extends Action {
  ActionDamage(Actor dealer, Actor recipient, float amount) {

    name = "damage";

    Combat recipientCombatComponent = (Combat) recipient.getComponent("combat");

    if (recipientCombatComponent == null) return;

    recipientCombatComponent.takeDamage(amount);
  }
}

class ActionSwitchPawn extends Action {

  ActionSwitchPawn(Controller currentController, Actor newPawn, View currentView) {

    name = "switch_pawn";

    if (currentController.pawn.getComponent("ai_movement") != null) currentController.pawn.enableComponent("ai_movement");
    if (newPawn.getComponent("movement") == null) newPawn.addComponent(new Movement(newPawn));
    if (newPawn.getComponent("ai_movement") != null) newPawn.disableComponent("ai_movement");

    currentController.setPawn(newPawn);
    currentView.setTarget(newPawn);
  }
}
