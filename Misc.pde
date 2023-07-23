// the purpose of this class is to translate the mouse coordinates to the view's location
class Cursor extends Actor {

  // fields
  Actor draggingTarget;

  Cursor() {

    name = "cursor";
    x = 1000;
    y = 1000;
    visible = false;
    setSize(24, 24); // size of cursor hitbox
  }

  void update() {
    super.update();

    x = mouseX + levels[currentLevel].view.x;
    y = mouseY + levels[currentLevel].view.y;
  }

  void draw() {
    super.draw();
  }

  boolean isDraggingActor(Actor a) {

    return a.equals(draggingTarget) && mousePressed;
  }

  void tryDraggingActor(Actor a) {

    if (draggingTarget == null && globalMouseDraggingActor == null) draggingTarget = a;

    if (isDraggingActor(a)) {

      draggingTarget.x = x;
      draggingTarget.y = y;
    }

    if (!mousePressed) draggingTarget = null;
  }
}

class BoundingBox extends Component {

  float x1, x2, y1, y2;

  BoundingBox(Actor parent, float x1, float y1, float x2, float y2) {
    name = "bounding_box";
    this.parent = parent;
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
  }

  void update() {

    if (parent.x - parent.w*.5 < x1) parent.x = x1 + parent.w*.5;
    if (parent.x + parent.w*.5 > x2) parent.x = x2 - parent.w*.5;
    if (parent.y - parent.h*.5 < y1) parent.y = y1 + parent.h*.5;
    if (parent.y + parent.h*.5 > y2) parent.y = y2 - parent.h*.5;
  }

  void draw() {

    if (!visible) return;
    
    strokeWeight(1);
    stroke(RED);
    noFill();
    rect(x1, y1, x2-x1, y2-y1);
  }
}
