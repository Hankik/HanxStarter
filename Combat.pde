class Combat extends Component {

  // fields
  float maxHealth = 10;
  float health = maxHealth;
  float baseDamage = 1;
  float damage = baseDamage;
  Timer damageCooldown = new Timer(1.5);
  
  Combat(Actor parent){
  
    name = "combat";
    
    this.parent = parent;
  }
  
  void update(){
  
    damageCooldown.update();
  }
  
  void draw(){
  
    // this draws health bar above parent actor
    if (visible) {
      noStroke();
      pushMatrix();
      fill(WHITE);
      translate(parent.x, parent.y);
      rect(-parent.w*.5, -parent.h*.8, parent.w, 3);
      fill(RED);
      rect(-parent.w*.5, -parent.h*.8, parent.w*(health/maxHealth), 3);
      popMatrix();
      strokeWeight(4);
    }
  }
  
  void takeDamage(float amount){
  
    health -= amount;
    if (health <= 0) parent.kill();
  }
  
}
