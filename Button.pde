class Button extends Actor {

  // fields
  String text = "";
  boolean enabled = true;
  ButtonState state = ButtonState.IDLE;
  Action purpose;
  Actor target = this;

  Button(float xPos, float yPos, float w, float h, String text, Action purpose) {

    name = "button";

    x = xPos;
    y = yPos;
    setSize(w, h);
    this.text = text;
    this.purpose = purpose;
  }

  void update() {
    super.update();

    if (!enabled) return;

    switch (state) {

    case IDLE:
      if (mouseX > x - w*.5 && mouseX < x + w*.5 && mouseY > y - h*.5 && mouseY < y + h*.5) {
        state = ButtonState.HOVERED;
      }
      break;
    case HOVERED:
      if (mouseX > x - w*.5 && mouseX < x + w*.5 && mouseY > y - h*.5 && mouseY < y + h*.5) {
      } else {
        state = ButtonState.IDLE;
      }
      break;
    case PRESSED:
      if (mouseX > x - w*.5 && mouseX < x + w*.5 && mouseY > y - h*.5 && mouseY < y + h*.5){
      
      } else {
        state = ButtonState.IDLE;
      }
    
      break;
    case RELEASED:
      purpose.execute();
      //try {
      //  target.addAction( purpose.clone() );
      //} catch (Exception e) {
      //}
      state = ButtonState.IDLE;
      
      break;
    }
  }

  void draw() {

    super.draw();

    switch(state) {

    case IDLE:
      fill(LIGHTBLUE);

      break;

    case HOVERED:
      fill(BLUE);
      break;

    case PRESSED:
      fill(BLACK);
      break;
    case RELEASED:
      fill(BLACK);
      break;
    }

    stroke(0);
    strokeWeight(1);
    rect(x - w*.5, y-h*.5, w, h, 14);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(text, x, y );
  }
  
  void setTarget(Actor target){
  
    this.target = target;
  }
  
  void setPurpose(Action purpose){
  
    this.purpose = purpose;
  }

  void mousePressed() {

    if (state == ButtonState.HOVERED) {

      println("button pressed");

      state = ButtonState.PRESSED;
    }
  }

  void mouseReleased() {

    if (state == ButtonState.PRESSED) {

      state = ButtonState.RELEASED;
    }
  }
}

// FIGURE OUT HOW TO USE MOUSEPRESSED WITHIN CLASS OR EQUIVALENT

public enum ButtonState {

  IDLE,
    HOVERED,
    PRESSED,
    RELEASED,
}
