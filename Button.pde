class Button extends Actor {

  // fields
  String text = "";
  boolean enabled = true;
  ButtonState state = ButtonState.IDLE;

  Button(float xPos, float yPos, float w, float h, String text) {

    name = "button";

    x = xPos;
    y = yPos;
    setSize(w, h);
    this.text = text;
  }

  void update() {
    super.update();

    if (!enabled) return;

    if (mouseX > x - w*.5 && mouseX < x + w*.5 && mouseY > y - h*.5 && mouseY < y + h*.5) {

      state = ButtonState.HOVERED;
    } else {
      state = ButtonState.IDLE;
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
      //if (leftMousePressed) fill(BLACK);
      break;

    case PRESSED:
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
}

// FIGURE OUT HOW TO USE MOUSEPRESSED WITHIN CLASS OR EQUIVALENT

public enum ButtonState {

  IDLE,
    HOVERED,
    PRESSED,
}
