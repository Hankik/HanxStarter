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
